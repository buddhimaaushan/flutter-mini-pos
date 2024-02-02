import 'package:uuid/uuid.dart';

const Uuid _uuid = Uuid();

class CategoryItem {
  final String id;
  final String name;
  final String? description;

  CategoryItem({
    required this.id,
    required this.name,
    this.description,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }

  static List<CategoryItem> categories = [
    CategoryItem(
      id: _uuid.v4(),
      name: "Bed Sheet",
      description: "Bed Sheet",
    ),
    CategoryItem(
      id: _uuid.v4(),
      name: "Towel",
      description: "towel",
    ),
    CategoryItem(
      id: _uuid.v4(),
      name: "Scarf",
      description: "Scarf",
    ),
  ];

  static getCategoryById(String id) {
    return categories.firstWhere((element) => element.id == id);
  }
}
