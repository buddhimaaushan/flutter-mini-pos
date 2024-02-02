import 'package:uuid/uuid.dart';

const Uuid _uuid = Uuid();

class InventoryItem {
  final String id;
  final int code;
  final String name;
  final int qty;
  final int cost;
  final int price;
  final String? description;
  final String category;
  final String brand;
  final String supplier;
  final String? image;

  InventoryItem({
    required this.id,
    required this.code,
    required this.name,
    required this.qty,
    required this.cost,
    required this.price,
    required this.category,
    required this.brand,
    required this.supplier,
    this.description,
    this.image,
  });

  factory InventoryItem.fromJson(Map<String, dynamic> json) {
    return InventoryItem(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      qty: json['qty'],
      cost: json['cost'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      brand: json['brand'],
      supplier: json['supplier'],
      image: json['image'],
    );
  }

  static List<InventoryItem> inventories = [
    InventoryItem(
        id: _uuid.v4(),
        code: 1,
        name: "Towel",
        qty: 50,
        cost: 510,
        price: 320,
        description: "Towel",
        category: "Towel",
        brand: "CK",
        supplier: "Maharagama",
        image: null),
    InventoryItem(
      id: _uuid.v4(),
      code: 2,
      name: "BED SHEET SINGLE",
      qty: 10,
      cost: 100,
      price: 200,
      description: "BED SHEET SINGLE",
      category: "BED SHEET",
      brand: "VS",
      supplier: "Fort",
      image: null,
    ),
    InventoryItem(
        id: _uuid.v4(),
        code: 2,
        name: "TOO LONG NAME FOR INVENTORY BED SHEET SINGLE",
        qty: 10,
        cost: 100,
        price: 200,
        description: "BED SHEET SINGLE",
        category: "BED SHEET",
        brand: "VS",
        supplier: "Fort",
        image: null)
  ];

  static getInventoryById(String id) {
    return inventories.firstWhere((element) => element.id == id);
  }
}
