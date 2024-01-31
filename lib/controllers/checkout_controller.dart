import 'package:get/get.dart';
import 'package:mini_pos/data/models/checkout_model.dart';
import 'package:mini_pos/ui/components/checkout_tab_pane.dart';

class CheckoutTabPaneController extends GetxController {
  RxInt checkoutTabPaneSelected = 0.obs;
  RxList<CheckoutTabPane> checkoutTabPaneList = <CheckoutTabPane>[
    const CheckoutTabPane(),
    const CheckoutTabPane(),
    const CheckoutTabPane(),
  ].obs;

  void addNewTab() {
    checkoutTabPaneList.add(const CheckoutTabPane());
  }

  void removeTab(int index) {
    if (checkoutTabPaneSelected >= checkoutTabPaneList.length) {
      checkoutTabPaneSelected.value = checkoutTabPaneList.length - 1;
    } else if (checkoutTabPaneSelected >= index &&
        checkoutTabPaneSelected.value != 0) {
      checkoutTabPaneSelected.value = checkoutTabPaneSelected.value - 1;
    }
    if (checkoutTabPaneList.length > 1) {
      checkoutTabPaneList.removeAt(index);
    }
  }

  void selectTab(int index) {
    checkoutTabPaneSelected.value = index;
  }

  void addItem(CheckoutTabPane item) {
    checkoutTabPaneList.add(item);
  }

  void removeItem(CheckoutTabPane item) {
    checkoutTabPaneList.remove(item);
  }
}

class CheckoutItemListController extends GetxController {
  RxList<CheckoutItem> checkoutItemList = <CheckoutItem>[
    CheckoutItem(
      id: RxString("1"),
      code: RxInt(1),
      name: RxString("Item 1"),
      avQty: RxInt(20),
      ordQty: RxInt(5),
      priceItem: RxInt(100),
      category: RxString('Category 1'),
      brand: RxString('Brand 1'),
      supplier: RxString('Supplier 1'),
      image: null,
    ),
    CheckoutItem(
      id: RxString("2"),
      code: RxInt(1),
      name: RxString("Item 2"),
      avQty: RxInt(20),
      ordQty: RxInt(5),
      priceItem: RxInt(100),
      category: RxString('Category 2'),
      brand: RxString('Brand 1'),
      supplier: RxString('Supplier 2'),
      image: null,
    ),
  ].obs;

  void addItem(CheckoutItem item) {
    checkoutItemList.add(item);
  }

  void removeItem(int index) {
    checkoutItemList.removeAt(index);
  }

  void updateItem(CheckoutItem item) {
    int index = checkoutItemList.indexOf(item);
    checkoutItemList[index] = item;
  }
}
