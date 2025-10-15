import '../../../../features/buy_me/controller/buy_me_controller.dart';
import '../../../../features/choose_the_service/controller/order_data_controller.dart';
import 'package:get/get.dart';

import '../../../core/network/utils/api_service.dart';
import '../../add_a_delivery_address/controller/add_a_delivery_address_controller.dart';
import '../../add_a_delivery_address/controller/add_a_delivery_repo.dart';
import '../../saved_delivery_addresses/controller/saved_delivery_addresses_controller.dart';
import '../../saved_delivery_addresses/controller/saved_delivery_addresses_repo.dart';

class BuyMeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BuyMeController());
    Get.lazyPut<AddADeliveryRepo>(
      () => AddADeliveryRepo(Get.find<ApiService>()),
    );
    Get.lazyPut<SavedDeliveryAddressesRepo>(
      () => SavedDeliveryAddressesRepo(Get.find<ApiService>()),
    );
    Get.lazyPut(() => SavedDeliveryAddressesController());

    Get.lazyPut(() => AddADeliveryAddressController());
    Get.lazyPut(() => OrderDataController());
  }
}
