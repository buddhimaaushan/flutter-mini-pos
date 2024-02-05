import 'package:flutter/material.dart';

class DataTableItemCount extends StatelessWidget {
  final String title;
  final int itemCount;

  const DataTableItemCount(
      {Key? key, required this.title, required this.itemCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$title : ",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Theme.of(context)
                  .colorScheme
                  .onSecondaryContainer
                  .withOpacity(0.4),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            itemCount.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Theme.of(context)
                  .colorScheme
                  .onSecondaryContainer
                  .withOpacity(0.4),
            ),
          ),
        ],
      ),
    );
  }
}
