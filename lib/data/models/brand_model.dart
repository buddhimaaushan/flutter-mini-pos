import 'package:uuid/uuid.dart';

const Uuid _uuid = Uuid();

class BrandItem {
  final String id;
  final String name;
  final String? description;

  BrandItem({
    required this.id,
    required this.name,
    this.description,
  });

  factory BrandItem.fromJson(Map<String, dynamic> json) {
    return BrandItem(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }

  static List<BrandItem> brands = [
    BrandItem(
      id: _uuid.v4(),
      name: "VS",
      description: "Victoria Secret",
    ),
    BrandItem(
      id: _uuid.v4(),
      name: "Moose",
      description: "Moose",
    ),
    BrandItem(
      id: _uuid.v4(),
      name: "Crocodile",
      description: "Crocodile",
    ),
  ];
}
