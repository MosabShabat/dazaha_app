import 'package:dazaha_app/features/my_ads/controller/transportation_and_delivery_controller.dart';
import 'package:get/get.dart';

class TransportationAndDeliveryBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransportationAndDeliveryController());
  }
}
