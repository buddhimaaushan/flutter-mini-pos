import 'package:get/get.dart';

class CheckoutItem {
  Rx<String> id;
  Rx<int> code;
  Rx<String> name;
  Rx<int> avQty;
  Rx<int> ordQty;
  Rx<int> priceItem;
  Rx<String> category;
  Rx<String> brand;
  Rx<String> supplier;
  Rx<String>? image;
  Rx<String>? description;

  CheckoutItem({
    required this.id,
    required this.code,
    required this.name,
    required this.avQty,
    required this.ordQty,
    required this.priceItem,
    required this.category,
    required this.brand,
    required this.supplier,
    this.description,
    this.image,
  });

  factory CheckoutItem.fromJson(Map<String, dynamic> json) {
    return CheckoutItem(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      avQty: json['qty'],
      ordQty: json['cost'],
      priceItem: json['price'],
      description: json['description'],
      category: json['category'],
      brand: json['brand'],
      supplier: json['supplier'],
      image: json['image'],
    );
  }

  factory CheckoutItem.initial() {
    return CheckoutItem(
      id: RxString("initial"),
      code: RxInt(0),
      name: RxString("Search Item"),
      avQty: RxInt(0),
      ordQty: RxInt(0),
      priceItem: RxInt(0),
      category: RxString('null'),
      brand: RxString('null'),
      supplier: RxString('null'),
      image: null,
      description: null,
    );
  }
}
