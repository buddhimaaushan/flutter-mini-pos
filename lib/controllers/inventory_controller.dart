import 'package:get/get.dart';
import 'package:mini_pos/data/models/inventory_model.dart';

class InventoryController extends GetxController {
  RxList<InventoryItem> iventoryState = InventoryItem.inventories.obs;

  void addItem(InventoryItem item) {
    iventoryState.add(item);
  }

  void removeItem(InventoryItem item) {
    iventoryState.remove(item);
  }

  void updateItem(InventoryItem item, bool imgUpdated) {
    int index = iventoryState.indexOf(item);
    iventoryState[index] = item;
  }
}
