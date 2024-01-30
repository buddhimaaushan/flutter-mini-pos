import 'package:flutter/material.dart';

class SidebarState {
  int selected = 0;
  bool mode = false;
}

class SidebarListItem {
  String title = "";
  IconData icon;

  SidebarListItem({required this.icon, required this.title});

  factory SidebarListItem.fromJson(Map<String, dynamic> json) {
    return SidebarListItem(
      icon: json['icon'],
      title: json['title'],
    );
  }

  static List<SidebarListItem> items = [
    SidebarListItem(
      title: "Checkout",
      icon: Icons.check_box,
    ),
    SidebarListItem(
      title: "Inventory",
      icon: Icons.inventory,
    ),
    SidebarListItem(
      title: "Category",
      icon: Icons.account_tree,
    ),
    SidebarListItem(
      title: "Supplier",
      icon: Icons.group,
    ),
    SidebarListItem(
      title: "Brand",
      icon: Icons.business,
    ),
    SidebarListItem(
      title: "Theme",
      icon: Icons.palette,
    ),
  ];
}
