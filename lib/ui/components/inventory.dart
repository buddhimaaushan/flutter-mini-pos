import 'dart:convert';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_pos/controllers/inventory_controller.dart';
import 'package:mini_pos/ui/components/datatable_item_count.dart';
import 'package:mini_pos/ui/components/page_name.dart';

import 'ex_data_table.dart';

class Inventory extends StatelessWidget {
  const Inventory({Key? key}) : super(key: key);

  InventoryController get inventoryController => Get.put(InventoryController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            const PageName(
              title: "INVENTORY",
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
                    fixedLeftColumns: 3,
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
                itemCount: inventoryController.iventoryItemList.length),
          ],
        ),
      ),
    );
  }

  List<DataColumn> _buildDataColumns(BuildContext context) {
    return [
      const DataColumn2(label: Text(""), size: ColumnSize.S),
      const DataColumn2(label: Text("Code"), size: ColumnSize.S),
      const DataColumn2(label: Text("Item Name"), size: ColumnSize.L),
      const DataColumn2(label: Text("Quantity"), size: ColumnSize.M),
      const DataColumn2(label: Text("Cost"), size: ColumnSize.M),
      const DataColumn2(label: Text("Price"), size: ColumnSize.M),
      const DataColumn2(label: Text("Category"), size: ColumnSize.M),
      const DataColumn2(label: Text("Brand"), size: ColumnSize.M),
      const DataColumn2(label: Text("Supplier"), size: ColumnSize.M),
      const DataColumn2(label: Text("Image"), size: ColumnSize.M),
      const DataColumn2(label: Text("Description"), size: ColumnSize.M),
    ];
  }

  List<DataRow> _buildDataRow(BuildContext context) {
    return [
      for (final (idx, item) in inventoryController.iventoryItemList.indexed)
        DataRow(
          cells: <DataCell>[
            DataCell(IconButton(
              onPressed: () {
                // inventoryController.removeItem(idx);
              },
              icon: const Icon(
                Icons.search,
                size: 15,
              ),
            )),
            DataCell(Text(item.code.toString())),
            DataCell(SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(item.name.toString()))),
            DataCell(Text(item.qty.toString())),
            DataCell(Text(item.cost.toString())),
            DataCell(Text(item.price.toString())),
            DataCell(SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(item.category.toString()))),
            DataCell(SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(item.brand.toString()))),
            DataCell(SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(item.supplier.toString()))),
            DataCell(item.image == null
                ? const SizedBox()
                : Image(
                    image: MemoryImage(base64Decode(item.image.toString())),
                  )),
            DataCell(SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(item.description.toString()))),
          ],
        )
    ];
  }
}
