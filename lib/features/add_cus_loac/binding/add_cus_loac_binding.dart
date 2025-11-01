import '../../../core/constant/exports_libraries.dart';
import '../../add_a_delivery_address/controller/add_a_delivery_address_controller.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../controller/add_cus_loac_controller.dart';

class AddCusLoacBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddCusLoacController());
    Get.lazyPut(() => OrderDataController());
    Get.lazyPut(() => AddADeliveryAddressController());

    //OrderDataController
  }
}
