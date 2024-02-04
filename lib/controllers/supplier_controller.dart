import 'package:get/get.dart';
import 'package:mini_pos/data/models/supplier_model.dart';
import 'package:uuid/uuid.dart';

const Uuid _uuid = Uuid();

class SupplierController extends GetxController {
  RxList<SupplierItem> supplierItemList = SupplierItem.suppliers.obs;

  void addItem({required String name, String? description}) {
    supplierItemList.add(SupplierItem(
      id: _uuid.v4(),
      name: name,
      description: description,
    ));
  }

  void removeItem(int index) {
    supplierItemList.removeAt(index);
  }

  void updateItem(SupplierItem item, bool imgUpdated) {
    int index = supplierItemList.indexOf(item);
    supplierItemList[index] = item;
  }
}
