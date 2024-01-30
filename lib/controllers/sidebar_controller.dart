import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mini_pos/data/models/sidebar_model.dart';

class SidebarController extends GetxController {
  Rx<SidebarState> sidebarState = SidebarState().obs;

  void setSelected(int index) {
    sidebarState.update((SidebarState? sidebar) {
      sidebar!.selected = index;
    });
  }

  void setMode(bool mode) {
    sidebarState.update((SidebarState? sidebar) {
      sidebar!.mode = mode;
    });
  }

  void toggleMode() {
    sidebarState.update((SidebarState? sidebar) {
      sidebar!.mode = !sidebar.mode;
    });
  }
}
