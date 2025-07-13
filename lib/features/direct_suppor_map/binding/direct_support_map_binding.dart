import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/features/direct_suppor_map/controller/direct_support_map_controller.dart';

class DirectSupportMapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DirectSupportMapController());
  }
}
