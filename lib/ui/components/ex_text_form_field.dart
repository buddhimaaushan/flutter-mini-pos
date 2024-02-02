import 'package:flutter/material.dart';

class ExTextFormField extends StatelessWidget {
  final String initialValue;
  final Color fillColor;
  final void Function(String, TextEditingController)? onFieldSubmitted;

  const ExTextFormField(
      {Key? key,
      required this.initialValue,
      required this.fillColor,
      this.onFieldSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController =
        TextEditingController.fromValue(TextEditingValue(
      text: initialValue,
    ));

    return TextFormField(
      key: UniqueKey(),
      controller: textEditingController,
      keyboardType: const TextInputType.numberWithOptions(
        signed: false,
        decimal: false,
      ),
      onFieldSubmitted: (value) {
        onFieldSubmitted!(value, textEditingController);
      },
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: fillColor,
        contentPadding: const EdgeInsets.only(left: 15, right: 5, bottom: 6),
      ),
    );
  }
}
