import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/features/select_a_location_on_the_map/controller/select_a_location_on_the_map_controller.dart';

class SelectALocationOnTheMapBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectALocationOnTheMapController());
  }
}
