import 'dart:convert';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_pos/controllers/brand_controller.dart';

import 'ex_data_table.dart';

class Brand extends StatelessWidget {
  const Brand({Key? key}) : super(key: key);

  BrandController get brandBrandController => Get.put(BrandController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Row(),
        _buildHeaderBar(context),
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
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          color:
              Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: const [],
      ),
    );
  }

  List<DataColumn> _buildDataColumns(BuildContext context) {
    return [
      DataColumn2(label: _buildInventoryNumber(context), size: ColumnSize.S),
      const DataColumn2(label: Text("Id")),
      const DataColumn2(
        label: Text("Brand Name"),
      ),
      const DataColumn2(label: Text("Description")),
    ];
  }

  Widget _buildInventoryNumber(BuildContext context) {
    final int inventoryListLength = brandBrandController.brandItemList.length;
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        width: inventoryListLength < 100
            ? 40
            : inventoryListLength < 1000
                ? 50
                : inventoryListLength < 10000
                    ? 60
                    : double.infinity,
        height: 40,
        alignment: Alignment.center,
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
                  .withOpacity(0.5),
            )),
        child: Text(brandBrandController.brandItemList.length.toString()),
      ),
    );
  }

  List<DataRow> _buildDataRow(BuildContext context) {
    return [
      for (final (idx, item) in brandBrandController.brandItemList.indexed)
        DataRow(
          cells: <DataCell>[
            DataCell(IconButton(
              onPressed: () {
                // brandBrandController.removeItem(idx);
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
