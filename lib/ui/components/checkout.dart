import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_pos/controllers/checkout_controller.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  CheckoutTabPaneController get checkoutTabPaneController =>
      Get.put(CheckoutTabPaneController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Obx(() =>
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Row(),
            _buildTab(context),
            const SizedBox(height: 10),
            Expanded(
                child: checkoutTabPaneController.checkoutTabPaneList[
                    checkoutTabPaneController.checkoutTabPaneSelected.value]),
          ])),
    );
  }

  Widget _buildTab(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        for (final (idx, _)
            in checkoutTabPaneController.checkoutTabPaneList.indexed)
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: TextButton(
              onPressed: () => checkoutTabPaneController.selectTab(idx),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    checkoutTabPaneController.checkoutTabPaneSelected.value ==
                            idx
                        ? Theme.of(context).colorScheme.primaryContainer
                        : Theme.of(context)
                            .colorScheme
                            .secondaryContainer
                            .withOpacity(0.2)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                  // borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(10),
                  //     topRight: Radius.circular(10)),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                )),
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(50, 60)),
              ),
              child: SizedBox(
                width: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(idx.toString()),
                    ),
                    checkoutTabPaneController.checkoutTabPaneList.length > 1
                        ? IconButton(
                            onPressed: () =>
                                checkoutTabPaneController.removeTab(idx),
                            icon: const Icon(
                              Icons.cancel,
                              size: 18,
                            ),
                          )
                        : const SizedBox(
                            width: 0,
                            height: 0,
                          )
                  ],
                ),
              ),
            ),
          ),
        IconButton(
          onPressed: () => checkoutTabPaneController.addNewTab(),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.primaryContainer),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            )),
          ),
          icon: const Icon(Icons.add),
          // iconSize: 20,
        ),
      ]),
    );
  }
}
