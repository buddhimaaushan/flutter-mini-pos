import 'package:flutter/material.dart';
import 'package:mini_pos/ui/components/brand.dart';
import 'package:mini_pos/ui/components/category.dart';
import 'package:mini_pos/ui/components/checkout.dart';
import 'package:mini_pos/ui/components/inventory.dart';
import 'package:mini_pos/ui/components/supplier.dart';
import 'package:mini_pos/ui/components/app_theme.dart';

class SidebarState {
  int selected = 0;
  bool mode = false;
}

class SidebarListItem {
  String title = "";
  IconData icon;
  Widget view;

  SidebarListItem(
      {required this.icon, required this.title, required this.view});

  factory SidebarListItem.fromJson(Map<String, dynamic> json) {
    return SidebarListItem(
      icon: json['icon'],
      title: json['title'],
      view: json['view'],
    );
  }

  static List<SidebarListItem> items = [
    SidebarListItem(
      title: "Checkout",
      icon: Icons.check_box,
      view: Checkout(),
    ),
    SidebarListItem(
      title: "Inventory",
      icon: Icons.inventory,
      view: Inventory(),
    ),
    SidebarListItem(
      title: "Category",
      icon: Icons.account_tree,
      view: Category(),
    ),
    SidebarListItem(
      title: "Supplier",
      icon: Icons.group,
      view: Supplier(),
    ),
    SidebarListItem(
      title: "Brand",
      icon: Icons.business,
      view: Brand(),
    ),
    SidebarListItem(
      title: "Theme",
      icon: Icons.palette,
      view: AppTheme(),
    ),
  ];
}
