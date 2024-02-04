import 'package:get/get.dart';
import 'package:mini_pos/data/models/brand_model.dart';
import 'package:uuid/uuid.dart';

const Uuid _uuid = Uuid();

class BrandController extends GetxController {
  RxList<BrandItem> brandItemList = BrandItem.brands.obs;

  void getBrandById(String id) {
    brandItemList.firstWhere((element) => element.id == id);
  }

  void addItem({required String name, String? description}) {
    brandItemList.add(BrandItem(
      id: _uuid.v4(),
      name: name,
      description: description,
    ));
  }

  void removeItem(int index) {
    brandItemList.removeAt(index);
  }

  void updateItem(BrandItem item, bool imgUpdated) {
    int index = brandItemList.indexOf(item);
    brandItemList[index] = item;
  }
}
