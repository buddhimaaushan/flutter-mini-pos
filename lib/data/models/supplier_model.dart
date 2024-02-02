import 'package:uuid/uuid.dart';

const Uuid _uuid = Uuid();

class SupplierItem {
  final String id;
  final String name;
  final String? description;

  SupplierItem({
    required this.id,
    required this.name,
    this.description,
  });

  factory SupplierItem.fromJson(Map<String, dynamic> json) {
    return SupplierItem(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }

  static List<SupplierItem> suppliers = [
    SupplierItem(
      id: _uuid.v4(),
      name: "Fort",
      description: "Fort",
    ),
    SupplierItem(
      id: _uuid.v4(),
      name: "Maharagama",
      description: "maharagama",
    ),
    SupplierItem(
      id: _uuid.v4(),
      name: "Pettah",
      description: "Pettah",
    ),
  ];

  static getSupplierById(String id) {
    return suppliers.firstWhere((element) => element.id == id);
  }
}
