import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class ExDataTable extends StatelessWidget {
  final List<DataColumn> headers;
  final List<DataRow> rows;
  final int fixedLeftColumns;
  final int fixedTopRows;

  final bool isLoading;

  const ExDataTable(
      {Key? key,
      required this.headers,
      required this.rows,
      required this.isLoading,
      this.fixedLeftColumns = 0,
      this.fixedTopRows = 0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DataTable2(
      columns: headers,
      rows: rows,
      minWidth: 1200,
      lmRatio: 2,
      smRatio: 0.5,
      columnSpacing: 10,
      dataRowHeight: 55,
      fixedLeftColumns: fixedLeftColumns,
      fixedTopRows: fixedTopRows,
      horizontalMargin: 10,
      isVerticalScrollBarVisible: true,
      isHorizontalScrollBarVisible: true,
      scrollController: ScrollController(),
      headingRowColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.primaryContainer),
      dataRowColor: MaterialStateProperty.all<Color>(
        Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.4),
      ),
      dividerThickness: 2,
      decoration: BoxDecoration(
        color:
            Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.2),
      ),
    );
  }
}
