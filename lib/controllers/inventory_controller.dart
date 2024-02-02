import 'package:get/get.dart';
import 'package:mini_pos/data/models/inventory_model.dart';

class InventoryController extends GetxController {
  RxList<InventoryItem> iventoryItemList = InventoryItem.inventories.obs;

  void addItem(InventoryItem item) {
    iventoryItemList.add(item);
  }

  void removeItem(int index) {
    iventoryItemList.removeAt(index);
  }

  void updateItem(InventoryItem item, bool imgUpdated) {
    int index = iventoryItemList.indexOf(item);
    iventoryItemList[index] = item;
  }
}
