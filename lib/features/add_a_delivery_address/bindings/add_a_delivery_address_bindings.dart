import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/features/add_a_delivery_address/controller/add_a_delivery_address_controller.dart';

class AddADeliveryAddressBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddADeliveryAddressController());
  }
}
