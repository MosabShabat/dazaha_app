import 'package:get/get.dart';
import '../../../core/network/utils/api_service.dart';
import '../controller/saved_delivery_addresses_controller.dart';
import '../controller/saved_delivery_addresses_repo.dart';

class SavedDeliveryAddressesBinding extends Bindings {
  @override
  void dependencies() {
      Get.lazyPut<SavedDeliveryAddressesRepo>(
      () => SavedDeliveryAddressesRepo(Get.find<ApiService>()),
    );
    Get.lazyPut(() => SavedDeliveryAddressesController());
  }
}
