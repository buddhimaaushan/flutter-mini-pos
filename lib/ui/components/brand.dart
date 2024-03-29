import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_pos/controllers/brand_controller.dart';
import 'package:mini_pos/ui/components/add_item_dialog.dart';
import 'package:mini_pos/ui/components/datatable_item_count.dart';
import 'package:mini_pos/ui/components/dialog_text_field.dart';
import 'package:mini_pos/ui/components/ex_dialog.dart';
import 'package:mini_pos/ui/components/ex_text_icon_button.dart';
import 'package:mini_pos/ui/components/page_name.dart';

import 'ex_data_table.dart';

class Brand extends StatelessWidget {
  const Brand({Key? key}) : super(key: key);

  BrandController get brandController => Get.put(BrandController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            const PageName(
              title: "BRAND",
              height: 52,
              padding: EdgeInsets.symmetric(horizontal: 20),
            ),
            const SizedBox(width: 10),
            _buildHeaderBar(context),
            const SizedBox(width: 10),
            ExTextIconButton(
              icon: const Icon(Icons.add),
              title: "Add New Brand",
              size: const Size(60, 60),
              onPressed: () {
                _handleAddNewButton(context);
              },
            )
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
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        height: 52,
        decoration: BoxDecoration(
            color: Theme.of(context)
                .colorScheme
                .secondaryContainer
                .withOpacity(0.2),
            borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.antiAlias,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => DataTableItemCount(
                    title: "BRAND ITEM COUNT",
                    itemCount: brandController.brandItemList.length),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<DataColumn> _buildDataColumns(BuildContext context) {
    return [
      const DataColumn2(label: Text(""), size: ColumnSize.S),
      const DataColumn2(label: Text("Id"), size: ColumnSize.L),
      const DataColumn2(label: Text("Brand Name"), size: ColumnSize.L),
      const DataColumn2(label: Text("Description"), size: ColumnSize.L),
    ];
  }

  List<DataRow> _buildDataRow(BuildContext context) {
    return [
      for (final (idx, item) in brandController.brandItemList.indexed)
        DataRow(
          cells: <DataCell>[
            DataCell(IconButton(
              onPressed: () {
                // brandController.removeItem(idx);
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

  void _handleAddNewButton(BuildContext context) {
    _buildNewBrandDialog(context);
  }

  void _buildNewBrandDialog(BuildContext context) {
    var item = <String, dynamic>{
      "brandName": "",
      "brandDescription": "",
    };

    Get.dialog(
      AddItemDialog(
        title: "Brand",
        dialogTextFieldList: [
          DialogTextField(
            label: "Brand Name",
            onFieldChanged: (value) {
              item["brandName"] = value;
            },
          ),
          DialogTextField(
            label: "Description",
            onFieldChanged: (value) {
              item["brandDescription"] = value;
            },
          ),
        ],
        onPressedAddItem: () => _handleAddItemButton(item),
      ),
      useSafeArea: true,
    );
  }

  void _handleAddItemButton(Map<String, dynamic> item) {
    try {
      if (item["brandName"].isEmpty) {
        throw Exception("Brand name cannot be empty");
      }

      brandController.addItem(
          name: item["brandName"], description: item["brandDescription"]);
      Get.back();
    } catch (e) {
      Get.dialog(ExDialog(title: "Error", message: e.toString()));
    }
  }
}
