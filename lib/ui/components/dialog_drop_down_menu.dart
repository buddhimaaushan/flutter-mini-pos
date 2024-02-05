import 'package:flutter/material.dart';
import 'package:mini_pos/ui/components/ex_drop_down_menu.dart';

class DialogDropDownMenu extends StatelessWidget {
  final String label;
  final String hintText;
  final List<DropdownMenuEntry<dynamic>> menuEntries;
  final void Function(dynamic)? onSelected;
  const DialogDropDownMenu(
      {Key? key,
      required this.label,
      required this.hintText,
      required this.menuEntries,
      required this.onSelected})
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
          child: ExDropdownMenu(
            hintText: hintText,
            fillColor: Theme.of(context)
                .colorScheme
                .secondaryContainer
                .withOpacity(0.2),
            dropdownMenuEntries: menuEntries,
            onSelected: onSelected,
          ),
        )
      ],
    );
  }
}
