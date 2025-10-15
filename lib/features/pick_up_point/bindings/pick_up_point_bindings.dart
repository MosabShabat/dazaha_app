import '../../../../core/constant/exports_libraries.dart';
import '../../../../features/choose_the_service/controller/order_data_controller.dart';
import '../../../../features/pick_up_point/controller/pick_up_point_controller.dart';
import '../../../../features/saved_delivery_addresses/controller/saved_delivery_addresses_repo.dart';

import '../../../core/network/utils/api_service.dart';
import '../../add_a_delivery_address/controller/add_a_delivery_address_controller.dart';
import '../../add_a_delivery_address/controller/add_a_delivery_repo.dart';
import '../../saved_delivery_addresses/controller/saved_delivery_addresses_controller.dart';

class PickUpPointBindings extends Bindings {
  @override
  void dependencies() {
    //AddADeliveryAddressController
    Get.lazyPut<AddADeliveryRepo>(
      () => AddADeliveryRepo(Get.find<ApiService>()),
    );
    Get.lazyPut<SavedDeliveryAddressesRepo>(
      () => SavedDeliveryAddressesRepo(Get.find<ApiService>()),
    );
    Get.lazyPut(() => AddADeliveryAddressController());
    Get.lazyPut(() => PickUpPointController());
    Get.lazyPut(() => SavedDeliveryAddressesController());
    Get.lazyPut(() => OrderDataController());

    //OrderDataController
  }
}
