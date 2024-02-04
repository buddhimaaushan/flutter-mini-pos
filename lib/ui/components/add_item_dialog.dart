import 'package:flutter/material.dart';
import 'package:mini_pos/ui/components/dialog_text_field.dart';
import 'package:mini_pos/ui/components/ex_text_icon_button.dart';

class AddItemDialog extends StatelessWidget {
  final String title;
  final List<DialogTextField> dialogTextFieldList;
  final void Function()? onPressedAddItem;
  const AddItemDialog(
      {Key? key,
      required this.title,
      required this.dialogTextFieldList,
      required this.onPressedAddItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: 500,
          height: 345,
          decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .secondaryContainer
                  .withOpacity(0.1),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add New $title",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.none,
                      color: Theme.of(context)
                          .colorScheme
                          .onSecondaryContainer
                          .withOpacity(0.6)),
                ),
                const SizedBox(height: 10),
                const Divider(height: 1),

                for (final item in dialogTextFieldList) ...[
                  const SizedBox(height: 20),
                  item
                ],

                // const SizedBox(height: 20),
                // DialogTextField(
                //   label: "Description",
                //   onFieldChanged: (value) {
                //     brandDescription = value;
                //   },
                // ),
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerRight,
                  child: ExTextIconButton(
                      icon: const Icon(Icons.add),
                      title: "Add $title",
                      size: const Size(60, 50),
                      onPressed: onPressedAddItem),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
