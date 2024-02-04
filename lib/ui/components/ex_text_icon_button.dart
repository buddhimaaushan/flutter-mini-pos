import 'package:flutter/material.dart';

class ExTextIconButton extends StatelessWidget {
  final String title;
  final Widget icon;
  final Size size;
  final void Function()? onPressed;
  const ExTextIconButton(
      {Key? key,
      required this.icon,
      required this.title,
      required this.size,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            Theme.of(context).colorScheme.primaryContainer),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        )),
        minimumSize: MaterialStateProperty.all<Size>(size),
      ),
      icon: icon,
      label: Text(title),
    );
  }
}
