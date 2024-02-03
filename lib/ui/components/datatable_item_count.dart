import 'package:flutter/material.dart';

class DataTableItemCount extends StatelessWidget {
  final int itemCount;

  const DataTableItemCount({Key? key, required this.itemCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 40,
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 2),
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context)
                    .colorScheme
                    .secondaryContainer
                    .withOpacity(0.2),
                border: Border.all(
                  color: Theme.of(context)
                      .colorScheme
                      .onPrimaryContainer
                      .withOpacity(0.1),
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
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "ITEM",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context)
                      .colorScheme
                      .onSecondaryContainer
                      .withOpacity(0.4),
                ),
              ),
              Text(
                "COUNT",
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
        ],
      ),
    );
  }
}
