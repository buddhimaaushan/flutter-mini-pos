import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_pos/controllers/checkout_controller.dart';
import 'package:mini_pos/data/models/checkout_model.dart';
import 'package:mini_pos/data/models/inventory_model.dart';
import 'package:mini_pos/ui/components/ex_data_table.dart';

class CheckoutTabPane extends StatelessWidget {
  CheckoutTabPane({Key? key}) : super(key: key);

  CheckoutTabPaneController get checkoutTabPaneController =>
      Get.find<CheckoutTabPaneController>();

  final CheckoutItemListController checkoutItemListController =
      CheckoutItemListController();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAlias,
        child: ExDataTable(
            headers: _buildDataColumns(context),
            rows: _buildDataRow(context),
            isLoading: false)));
  }

  List<DataColumn> _buildDataColumns(BuildContext context) {
    return [
      DataColumn2(label: _buildTabNumber(context), size: ColumnSize.S),
      const DataColumn2(label: Text("Code"), size: ColumnSize.S),
      const DataColumn2(label: Text("Item Name"), size: ColumnSize.L),
      const DataColumn2(label: Text("Av Qty"), size: ColumnSize.M),
      const DataColumn2(label: Text("Ord Qty"), size: ColumnSize.M),
      const DataColumn2(label: Text("Price/Item"), size: ColumnSize.M),
      const DataColumn2(label: Text("Price"), size: ColumnSize.M),
      const DataColumn2(label: Text("Category"), size: ColumnSize.M),
      const DataColumn2(label: Text("Brand"), size: ColumnSize.M),
      const DataColumn2(label: Text("Supplier"), size: ColumnSize.M),
      const DataColumn2(label: Text("Image"), size: ColumnSize.M),
      const DataColumn2(label: Text("Description"), size: ColumnSize.M),
    ];
  }

  Widget _buildTabNumber(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        width: 40,
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
        child: Text(
            checkoutTabPaneController.checkoutTabPaneSelected.value.toString()),
      ),
    );
  }

  List<DataRow> _buildDataRow(BuildContext context) {
    return [
      for (final (idx, item)
          in checkoutItemListController.checkoutItemList.indexed)
        DataRow(
          cells: <DataCell>[
            DataCell(item.id.value == "initial"
                ? const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.arrow_right_alt))
                : IconButton(
                    onPressed: () {
                      checkoutItemListController.removeItem(idx);
                    },
                    icon: const Icon(
                      Icons.cancel,
                      size: 15,
                    ),
                  )),
            DataCell(Text(item.code.toString())),
            DataCell(_buildItemDropdownMenu(item)),
            DataCell(Text(item.avQty.toString())),
            DataCell(_buildOrderTextField(item)),
            DataCell(Text(item.priceItem.toString())),
            DataCell(
                Text((item.ordQty.value * item.priceItem.value).toString())),
            DataCell(Text(item.category.value)),
            DataCell(Text(item.brand.value)),
            DataCell(Text(item.supplier.value)),
            DataCell(Text(item.image.toString())),
            DataCell(Text(item.description.toString())),
          ],
        )
    ];
  }

  Widget _buildItemDropdownMenu(CheckoutItem item) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 6, right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,
      child: DropdownMenu(
        key: UniqueKey(),
        expandedInsets: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        onSelected: (value) {
          InventoryItem inventory = InventoryItem.inventories
              .firstWhere((element) => element.id == value);
          if (item.id.value == "initial") {
            checkoutItemListController.addItem(CheckoutItem.initial());
          }
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
        // label: Text(item.name.value),
        dropdownMenuEntries: [
          for (final inventory in InventoryItem.inventories)
            DropdownMenuEntry(
              value: inventory.id,
              label: inventory.name,
            )
        ],
        enableFilter: true,
        enableSearch: true,
        hintText: item.name.value,
        textStyle: const TextStyle(fontSize: 12),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(fontSize: 12),
          border: InputBorder.none,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          filled: true,
          fillColor: Theme.of(Get.context!)
              .colorScheme
              .secondaryContainer
              .withOpacity(item.id.value == "initial" ? 1 : 0.2),
          contentPadding: const EdgeInsets.only(left: 15, right: 5, bottom: 6),
        ),
      ),
    );
  }

  Widget _buildOrderTextField(CheckoutItem item) {
    TextEditingController textEditingController =
        TextEditingController.fromValue(TextEditingValue(
      text: item.ordQty.value.toString(),
    ));
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 6, right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,
      child: TextFormField(
        key: UniqueKey(),
        controller: textEditingController,
        keyboardType: const TextInputType.numberWithOptions(
          signed: false,
          decimal: false,
        ),
        onFieldSubmitted: (value) =>
            _handleOrderQty(textEditingController, value, item),
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          fillColor: Theme.of(Get.context!)
              .colorScheme
              .secondaryContainer
              .withOpacity(item.id.value == "initial" ? 1 : 0.2),
          contentPadding: const EdgeInsets.only(left: 15, right: 5, bottom: 6),
        ),
      ),
    );
  }

  void _handleOrderQty(TextEditingController textEditingController,
      String value, CheckoutItem item) {
    textEditingController.value = TextEditingValue(
      text: value.isEmpty || int.parse(value) <= 1
          ? 1.toString()
          : int.parse(value) > item.avQty.value
              ? item.avQty.value.toString()
              : value,
    );
    if (value.isNotEmpty &&
        int.parse(value) >= 1 &&
        int.parse(value) <= item.avQty.value) {
      item.ordQty.value = int.parse(value);
    }
  }
}
