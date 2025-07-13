import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/features/pick_up_method_upon_delivery/controller/pick_up_method_upon_delivery_controller.dart';

class PickUpMethodUponDeliveryBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> PickUpMethodUponDeliveryController());
  }
}