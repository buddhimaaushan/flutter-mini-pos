import 'package:flutter/material.dart';

class PageName extends StatelessWidget {
  final String title;
  final double height;
  final EdgeInsetsGeometry padding;
  const PageName(
      {Key? key,
      required this.title,
      required this.height,
      required this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: padding,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color:
            Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.2),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          letterSpacing: 1,
          color: Theme.of(context)
              .colorScheme
              .onSecondaryContainer
              .withOpacity(0.4),
        ),
      ),
    );
  }
}
