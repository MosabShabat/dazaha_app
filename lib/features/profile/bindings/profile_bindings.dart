import '../../../core/network/utils/api_service.dart';
import '../../../features/profile/controller/profile_repo.dart';
import '../../../features/profile/controller/profile_controller.dart';
import 'package:get/get.dart';

import '../../saved_delivery_addresses/controller/saved_delivery_addresses_controller.dart';
import '../../saved_delivery_addresses/controller/saved_delivery_addresses_repo.dart';

class ProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileRepo>(() => ProfileRepo(Get.find<ApiService>()));
    Get.lazyPut<SavedDeliveryAddressesRepo>(
      () => SavedDeliveryAddressesRepo(Get.find<ApiService>()),
    );
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => SavedDeliveryAddressesController());

    //  Get.put(SavedDeliveryAddressesController());
  }
}
