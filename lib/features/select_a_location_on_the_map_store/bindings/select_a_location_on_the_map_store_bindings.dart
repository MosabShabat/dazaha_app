import '../../../core/constant/exports_libraries.dart';
import '../../../features/select_a_location_on_the_map_store/controller/select_a_location_on_the_map_store_controller.dart';

class SelectALocationOnTheMapStoreBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectALocationOnTheMapStoreController());
  }
}
