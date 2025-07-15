import 'package:dazaha_app/features/saved_delivery_addresses/controller/saved_delivery_addresses_controller.dart';
import 'package:get/get.dart';

class SavedDeliveryAddressesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SavedDeliveryAddressesController());
  }
}
