import 'package:flutter/material.dart';

class ExDropdownMenu extends StatelessWidget {
  final String hintText;
  final List<DropdownMenuEntry> dropdownMenuEntries;
  final Color? fillColor;
  final void Function(dynamic)? onSelected;

  const ExDropdownMenu({
    Key? key,
    required this.hintText,
    required this.dropdownMenuEntries,
    this.fillColor,
    this.onSelected,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return DropdownMenu(
      key: UniqueKey(),
      expandedInsets: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      onSelected: onSelected,
      dropdownMenuEntries: dropdownMenuEntries,
      enableFilter: true,
      enableSearch: true,
      hintText: hintText,
      textStyle: const TextStyle(fontSize: 12),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(fontSize: 12),
        border: InputBorder.none,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
        fillColor: fillColor,
        contentPadding: const EdgeInsets.only(left: 15, right: 5, bottom: 6),
      ),
      menuStyle: MenuStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
