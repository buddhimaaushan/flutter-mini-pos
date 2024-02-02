import 'package:get/get.dart';
import 'package:mini_pos/data/models/supplier_model.dart';

class SupplierController extends GetxController {
  RxList<SupplierItem> supplierItemList = SupplierItem.suppliers.obs;

  void addItem(SupplierItem item) {
    supplierItemList.add(item);
  }

  void removeItem(int index) {
    supplierItemList.removeAt(index);
  }

  void updateItem(SupplierItem item, bool imgUpdated) {
    int index = supplierItemList.indexOf(item);
    supplierItemList[index] = item;
  }
}
