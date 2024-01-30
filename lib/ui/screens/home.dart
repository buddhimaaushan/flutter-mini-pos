import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_pos/controllers/sidebar_controller.dart';
import 'package:mini_pos/data/models/sidebar_model.dart';
import 'package:mini_pos/ui/components/sidebar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  SidebarController get sidebarController => Get.find<SidebarController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        const Sidebar(),
        Obx(() => Expanded(
              child: SidebarListItem
                  .items[sidebarController.sidebarState.value.selected].view,
            ))
      ],
    ));
  }
}
