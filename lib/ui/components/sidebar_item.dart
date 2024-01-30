import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_pos/controllers/sidebar_controller.dart';

class SideBarItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final int index;

  const SideBarItem({
    Key? key,
    required this.index,
    required this.title,
    required this.icon,
  }) : super(key: key);

  SidebarController get sidebarController => Get.find<SidebarController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          height: 50,
          alignment: Alignment.centerLeft,
          child: Tooltip(
            message: title,
            textStyle: TextStyle(
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
            ),
            verticalOffset: 30,
            waitDuration: const Duration(milliseconds: 500),
            showDuration: const Duration(milliseconds: 100),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Theme.of(context).dividerColor.withOpacity(0.5),
                  width: 0.5,
                )),
            child: TextButton.icon(
                onPressed: () => sidebarController.setSelected(index),
                style: ButtonStyle(
                  alignment: Alignment.centerLeft,
                  minimumSize: MaterialStateProperty.all<Size>(
                    sidebarController.sidebarState.value.mode
                        ? const Size.fromHeight(50)
                        : const Size(10, 50),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.only(
                          top: 20, bottom: 20, left: 14, right: 6)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).colorScheme.onPrimaryContainer),
                  backgroundColor:
                      sidebarController.sidebarState.value.selected == index
                          ? MaterialStateProperty.all<Color>(
                              Theme.of(context).colorScheme.primaryContainer)
                          : null,
                ),
                icon: Icon(icon),
                // label: Text(title)
                label: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  switchInCurve: const Interval(0.5, 1),
                  child: sidebarController.sidebarState.value.mode
                      ? Padding(
                          key: Key(sidebarController.sidebarState.value.mode
                              .toString()),
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            title,
                          ),
                        )
                      : const SizedBox(width: 0, height: 0),
                )),
          ),
        ));
  }
}
