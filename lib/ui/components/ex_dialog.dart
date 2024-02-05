import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_pos/ui/components/ex_text_icon_button.dart';

class ExDialog extends StatelessWidget {
  final String title;
  final String message;
  final double? width;
  final double? height;
  const ExDialog({
    Key? key,
    required this.title,
    required this.message,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: width ?? 350,
            height: height ?? 250,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.none,
                    color: Theme.of(context)
                        .colorScheme
                        .onSecondaryContainer
                        .withOpacity(0.6),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  height: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      message,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                        color: Theme.of(context)
                            .colorScheme
                            .onSecondaryContainer
                            .withOpacity(0.6),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ExTextIconButton(
                    icon: const Icon(Icons.check),
                    title: "Ok",
                    size: const Size(100, 50),
                    onPressed: () => Get.back(),
                  ),
                ])
              ],
            ),
          )),
    );
  }
}
