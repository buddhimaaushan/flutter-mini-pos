import 'package:flutter/material.dart';
import 'package:mini_pos/ui/components/ex_text_form_field.dart';

class DialogTextField extends StatelessWidget {
  final String label;
  final void Function(
    String,
  )? onFieldChanged;
  const DialogTextField(
      {Key? key, required this.label, required this.onFieldChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
              color: Theme.of(context)
                  .colorScheme
                  .onSecondaryContainer
                  .withOpacity(0.6)),
        ),
        const SizedBox(
          height: 10,
        ),
        Material(
          borderRadius: BorderRadius.circular(10),
          clipBehavior: Clip.antiAlias,
          child: ExTextFormField(
            initialValue: "",
            fillColor: Theme.of(context)
                .colorScheme
                .secondaryContainer
                .withOpacity(0.3),
            onFieldChanged: onFieldChanged,
          ),
        ),
      ],
    );
  }
}
