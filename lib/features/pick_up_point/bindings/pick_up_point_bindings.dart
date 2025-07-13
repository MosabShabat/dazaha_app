import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/features/pick_up_point/controller/pick_up_point_controller.dart';

class PickUpPointBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> PickUpPointController());
  }
}