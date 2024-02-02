import 'package:get/get.dart';
import 'package:mini_pos/data/models/category_model.dart';

class CategoryController extends GetxController {
  RxList<CategoryItem> categoryItemList = CategoryItem.categories.obs;

  void addItem(CategoryItem item) {
    categoryItemList.add(item);
  }

  void removeItem(int index) {
    categoryItemList.removeAt(index);
  }

  void updateItem(CategoryItem item, bool imgUpdated) {
    int index = categoryItemList.indexOf(item);
    categoryItemList[index] = item;
  }
}
