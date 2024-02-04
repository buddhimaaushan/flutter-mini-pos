import 'package:get/get.dart';
import 'package:mini_pos/data/models/category_model.dart';
import 'package:uuid/uuid.dart';

const Uuid _uuid = Uuid();

class CategoryController extends GetxController {
  RxList<CategoryItem> categoryItemList = CategoryItem.categories.obs;

  void addItem({required String name, String? description}) {
    categoryItemList.add(CategoryItem(
      id: _uuid.v4(),
      name: name,
      description: description,
    ));
  }

  void removeItem(int index) {
    categoryItemList.removeAt(index);
  }

  void updateItem(CategoryItem item, bool imgUpdated) {
    int index = categoryItemList.indexOf(item);
    categoryItemList[index] = item;
  }
}
