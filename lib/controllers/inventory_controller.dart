import 'package:get/get.dart';
import 'package:mini_pos/data/models/inventory_model.dart';
import 'package:uuid/uuid.dart';

const Uuid _uuid = Uuid();

class InventoryController extends GetxController {
  RxList<InventoryItem> iventoryItemList = InventoryItem.inventories.obs;

  void addItem(
      {required int code,
      required String name,
      required int qty,
      required int cost,
      required int price,
      required String category,
      required String brand,
      required String supplier,
      String? image,
      String? description}) {
    iventoryItemList.add(InventoryItem(
        id: _uuid.v4(),
        code: code,
        name: name,
        qty: qty,
        cost: cost,
        price: price,
        category: category,
        brand: brand,
        supplier: supplier,
        image: image,
        description: description));
  }

  void removeItem(int index) {
    iventoryItemList.removeAt(index);
  }

  void updateItem(InventoryItem item, bool imgUpdated) {
    int index = iventoryItemList.indexOf(item);
    iventoryItemList[index] = item;
  }
}
