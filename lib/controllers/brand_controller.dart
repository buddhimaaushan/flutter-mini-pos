import 'package:get/get.dart';
import 'package:mini_pos/data/models/brand_model.dart';

class BrandController extends GetxController {
  RxList<BrandItem> brandItemList = BrandItem.brands.obs;

  void addItem(BrandItem item) {
    brandItemList.add(item);
  }

  void removeItem(int index) {
    brandItemList.removeAt(index);
  }

  void updateItem(BrandItem item, bool imgUpdated) {
    int index = brandItemList.indexOf(item);
    brandItemList[index] = item;
  }
}
