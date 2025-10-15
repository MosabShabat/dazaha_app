import '../../../core/constant/exports_libraries.dart';
import '../../../features/add_a_delivery_address/controller/add_a_delivery_address_controller.dart';
import '../../../core/network/utils/api_service.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../../saved_delivery_addresses/controller/saved_delivery_addresses_controller.dart';
import '../../saved_delivery_addresses/controller/saved_delivery_addresses_repo.dart';
import '../controller/add_a_delivery_repo.dart';

class AddADeliveryAddressBindings extends Bindings {
  @override
  void dependencies() {
    // Repos
    Get.lazyPut(() => AddADeliveryRepo(Get.find<ApiService>()));
    Get.lazyPut(() => SavedDeliveryAddressesRepo(Get.find<ApiService>()));

    // Controllers
    Get.lazyPut(() => SavedDeliveryAddressesController());
    Get.lazyPut(() => AddADeliveryAddressController());
    Get.lazyPut(() => OrderDataController());
  }
}
