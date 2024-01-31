import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_pos/controllers/checkout_controller.dart';
import 'package:mini_pos/data/models/checkout_model.dart';
import 'package:mini_pos/data/models/inventory_model.dart';
import 'package:mini_pos/ui/components/ex_data_table.dart';

class CheckoutTabPane extends StatelessWidget {
  const CheckoutTabPane({Key? key}) : super(key: key);

  CheckoutItemListController get checkoutItemListController =>
      Get.put(CheckoutItemListController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAlias,
        child: ExDataTable(headers: const [
          DataColumn2(label: Text("Code"), size: ColumnSize.S),
          DataColumn2(label: Text("Item Name"), size: ColumnSize.L),
          DataColumn2(label: Text("Av Qty"), size: ColumnSize.M),
          DataColumn2(label: Text("Ord Qty"), size: ColumnSize.M),
          DataColumn2(label: Text("Price/Item"), size: ColumnSize.M),
          DataColumn2(label: Text("Price"), size: ColumnSize.M),
          DataColumn2(label: Text("Category"), size: ColumnSize.M),
          DataColumn2(label: Text("Brand"), size: ColumnSize.M),
          DataColumn2(label: Text("Supplier"), size: ColumnSize.M),
          DataColumn2(label: Text("Image"), size: ColumnSize.M),
          DataColumn2(label: Text("Description"), size: ColumnSize.M),
        ], rows: [
          for (final item in checkoutItemListController.checkoutItemList)
            DataRow(cells: <DataCell>[
              DataCell(Text(item.code.toString())),
              DataCell(_buildItemDropdownMenu(item)),
              DataCell(Text(item.avQty.toString())),
              DataCell(
                TextFormField(
                  initialValue: item.ordQty.toString(),
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (val) {
                    item.ordQty.value = int.parse(val);
                  },
                ),
              ),
              DataCell(Text(item.priceItem.toString())),
              DataCell(
                  Text((item.ordQty.value * item.priceItem.value).toString())),
              DataCell(Text(item.category.value)),
              DataCell(Text(item.brand.value)),
              DataCell(Text(item.supplier.value)),
              DataCell(Text(item.image.toString())),
              DataCell(Text(item.description.toString())),
            ])
        ], isLoading: false)));
  }

  Widget _buildItemDropdownMenu(CheckoutItem item) {
    return DropdownMenu(
      expandedInsets: EdgeInsets.all(10),
      onSelected: (value) {
        InventoryItem inventory = InventoryItem.inventories
            .firstWhere((element) => element.id == value);
        item.id.value = inventory.id;
        item.code.value = inventory.code;
        item.name.value = inventory.name;
        item.avQty.value = inventory.qty;
        item.ordQty.value = 1;
        item.priceItem.value = inventory.price;
        item.category.value = inventory.category;
        item.brand.value = inventory.brand;
        item.supplier.value = inventory.supplier;
        item.image?.value = inventory.image!;
        item.description?.value = inventory.description!;
      },
      label: Text(item.name.value),
      dropdownMenuEntries: [
        for (final inventory in InventoryItem.inventories)
          DropdownMenuEntry(
            value: inventory.id,
            label: inventory.name,
          )
      ],
      enableFilter: true,
      enableSearch: true,
      hintText: "Search Item",
      textStyle: TextStyle(fontSize: 14),
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(fontSize: 12),
          border: InputBorder.none,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding: EdgeInsets.only(bottom: 20)),
    );
  }
}
