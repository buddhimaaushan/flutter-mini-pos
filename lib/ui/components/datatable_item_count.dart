import 'package:flutter/material.dart';

class DataTableItemCount extends StatelessWidget {
  final int itemCount;

  const DataTableItemCount({Key? key, required this.itemCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "ITEM COUNT",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Theme.of(context)
                  .colorScheme
                  .onSecondaryContainer
                  .withOpacity(0.4),
            ),
          ),
          Container(
            // width: 40,
            // height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 2),
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Theme.of(context)
                    .colorScheme
                    .secondaryContainer
                    .withOpacity(0.5),
                border: Border.all(
                  color: Theme.of(context)
                      .colorScheme
                      .onPrimaryContainer
                      .withOpacity(0.2),
                )),
            child: Text(
              itemCount.toString(),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Theme.of(context)
                    .colorScheme
                    .onSecondaryContainer
                    .withOpacity(0.4),
              ),
            ),
          )
        ],
      ),
    );
  }
}
