import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_pos/controllers/supplier_controller.dart';
import 'package:mini_pos/ui/components/datatable_item_count.dart';
import 'package:mini_pos/ui/components/page_name.dart';

import 'ex_data_table.dart';

class Supplier extends StatelessWidget {
  const Supplier({Key? key}) : super(key: key);

  SupplierController get supplierSupplierController =>
      Get.put(SupplierController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            const PageName(
              title: "SUPPLIER",
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 20),
            ),
            const SizedBox(width: 10),
            _buildHeaderBar(context),
          ],
        ),
        const SizedBox(height: 10),
        Expanded(
            child: Obx(() => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.antiAlias,
                child: ExDataTable(
                    headers: _buildDataColumns(context),
                    rows: _buildDataRow(context),
                    isLoading: false)))),
      ]),
    );
  }

  Widget _buildHeaderBar(BuildContext context) {
    return Flexible(
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            color: Theme.of(context)
                .colorScheme
                .secondaryContainer
                .withOpacity(0.2),
            borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            DataTableItemCount(
                itemCount: supplierSupplierController.supplierItemList.length),
          ],
        ),
      ),
    );
  }

  List<DataColumn> _buildDataColumns(BuildContext context) {
    return [
      const DataColumn2(label: Text(""), size: ColumnSize.S),
      const DataColumn2(label: Text("Id"), size: ColumnSize.L),
      const DataColumn2(label: Text("Supplier Name"), size: ColumnSize.L),
      const DataColumn2(label: Text("Description"), size: ColumnSize.L),
    ];
  }

  List<DataRow> _buildDataRow(BuildContext context) {
    return [
      for (final (idx, item)
          in supplierSupplierController.supplierItemList.indexed)
        DataRow(
          cells: <DataCell>[
            DataCell(IconButton(
              onPressed: () {
                // supplierSupplierController.removeItem(idx);
              },
              icon: const Icon(
                Icons.search,
                size: 15,
              ),
            )),
            DataCell(Text(item.id.toString())),
            DataCell(SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(item.name.toString()))),
            DataCell(SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(item.description.toString()))),
          ],
        )
    ];
  }
}
