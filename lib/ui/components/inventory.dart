import 'dart:convert';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_pos/controllers/brand_controller.dart';
import 'package:mini_pos/controllers/category_controller.dart';
import 'package:mini_pos/controllers/inventory_controller.dart';
import 'package:mini_pos/controllers/supplier_controller.dart';
import 'package:mini_pos/ui/components/add_item_dialog.dart';
import 'package:mini_pos/ui/components/datatable_item_count.dart';
import 'package:mini_pos/ui/components/dialog_drop_down_menu.dart';
import 'package:mini_pos/ui/components/dialog_text_field.dart';
import 'package:mini_pos/ui/components/ex_dialog.dart';
import 'package:mini_pos/ui/components/ex_text_icon_button.dart';
import 'package:mini_pos/ui/components/page_name.dart';

import 'ex_data_table.dart';

class Inventory extends StatelessWidget {
  const Inventory({Key? key}) : super(key: key);

  InventoryController get inventoryController => Get.put(InventoryController());
  CategoryController get categoryController => Get.put(CategoryController());
  BrandController get brandController => Get.put(BrandController());
  SupplierController get supplierController => Get.put(SupplierController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            const PageName(
              title: "INVENTORY",
              height: 52,
              padding: EdgeInsets.symmetric(horizontal: 20),
            ),
            const SizedBox(width: 10),
            _buildHeaderBar(context),
            const SizedBox(width: 10),
            ExTextIconButton(
              icon: const Icon(Icons.add),
              title: "Add New Inventory",
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
                    fixedLeftColumns: 3,
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
            children: [
              Obx(
                () => DataTableItemCount(
                    title: "INVENTORY ITEM COUNT",
                    itemCount: inventoryController.iventoryItemList.length),
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

  void _handleAddNewButton(BuildContext context) {
    _buildNewInventoryDialog(context);
  }

  void _buildNewInventoryDialog(BuildContext context) {
    var item = <String, dynamic>{
      "code": 0,
      "itemName": "",
      "qty": 0,
      "cost": 0,
      "price": 0,
      "category": "",
      "brand": "",
      "supplier": "",
      "image": null,
      "description": "",
    };

    Get.dialog(
      AddItemDialog(
        title: "Inventory",
        height: 600,
        dialogTextFieldList: [
          DialogTextField(
            label: "Code *",
            onFieldChanged: (value) {
              item["code"] = value.isNum ? int.parse(value) : 0;
            },
          ),
          DialogTextField(
            label: "Item Name *",
            onFieldChanged: (value) {
              item["itemName"] = value;
            },
          ),
          DialogTextField(
            label: "Quantity *",
            onFieldChanged: (value) {
              item["qty"] = value.isNum ? int.parse(value) : 0;
            },
          ),
          DialogTextField(
            label: "Cost *",
            onFieldChanged: (value) {
              item["cost"] = value.isNum ? int.parse(value) : 0;
            },
          ),
          DialogTextField(
            label: "Price *",
            onFieldChanged: (value) {
              item["price"] = value.isNum ? int.parse(value) : 0;
            },
          ),
          DialogDropDownMenu(
              label: "Category *",
              hintText: item["itemName"],
              menuEntries: [
                for (final category in categoryController.categoryItemList)
                  DropdownMenuEntry(
                    value: category.name,
                    label: category.name,
                  ),
              ],
              onSelected: (value) {
                item["category"] = value;
              }),
          DialogDropDownMenu(
              label: "Brand *",
              hintText: item["brand"],
              menuEntries: [
                for (final brand in brandController.brandItemList)
                  DropdownMenuEntry(
                    value: brand.name,
                    label: brand.name,
                  ),
              ],
              onSelected: (value) {
                item["brand"] = value;
              }),
          DialogDropDownMenu(
              label: "Supplier *",
              hintText: item["supplier"],
              menuEntries: [
                for (final supplier in supplierController.supplierItemList)
                  DropdownMenuEntry(
                    value: supplier.name,
                    label: supplier.name,
                  ),
              ],
              onSelected: (value) {
                item["supplier"] = value;
              }),
          DialogTextField(
            label: "Description",
            onFieldChanged: (value) {
              item["description"] = value;
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
      if (item["code"] == 0) {
        throw Exception("Code cannot be zero or empty");
      }
      if (item["itemName"].isEmpty) {
        throw Exception("Item name cannot be empty");
      }
      if (item["qty"] == 0) {
        throw Exception("Quantity cannot be zero or empty");
      }
      if (item["cost"] == 0) {
        throw Exception("Cost cannot be zero or empty");
      }
      if (item["price"] == 0) {
        throw Exception("Price cannot be zero or empty");
      }
      if (item["category"].isEmpty) {
        throw Exception("Category cannot be empty");
      }
      if (item["brand"].isEmpty) {
        throw Exception("Brand cannot be empty");
      }
      if (item["supplier"].isEmpty) {
        throw Exception("Supplier cannot be empty");
      }
      inventoryController.addItem(
          code: item["code"],
          name: item["itemName"],
          qty: item["qty"],
          cost: item["cost"],
          price: item["price"],
          category: item["category"],
          brand: item["brand"],
          supplier: item["supplier"],
          image: item["image"],
          description: item["description"]);
      Get.back();
    } catch (e) {
      Get.dialog(ExDialog(title: "Error", message: e.toString()));
    }
  }
}
