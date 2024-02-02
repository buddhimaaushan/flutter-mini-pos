import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_pos/controllers/sidebar_controller.dart';
import 'package:mini_pos/data/models/sidebar_model.dart';
import 'package:mini_pos/ui/components/sidebar/sidebar_item.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  SidebarController get sidebarController => Get.put(SidebarController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          width: sidebarController.sidebarState.value.mode ? 200 : 62,
          child: Drawer(
            shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: IconButton(
                            onPressed: () => sidebarController.toggleMode(),
                            icon: sidebarController.sidebarState.value.mode
                                ? const Icon(
                                    Icons.arrow_back,
                                    size: 20,
                                  )
                                : const Icon(Icons.menu)),
                      ),
                    ],
                  ),
                  for (final (index, item) in SidebarListItem.items.indexed)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: SideBarItem(
                          index: index, title: item.title, icon: item.icon),
                    )
                ],
              ),
            ),
          ),
        ));
  }
}
