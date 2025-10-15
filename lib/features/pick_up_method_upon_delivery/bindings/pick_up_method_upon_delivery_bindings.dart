import '../../../../core/constant/exports_libraries.dart';
import '../../../../features/pick_up_method_upon_delivery/controller/pick_up_method_upon_delivery_controller.dart';

import '../../../core/network/utils/api_service.dart';
import '../../add_a_delivery_address/controller/add_a_delivery_repo.dart';
import '../../choose_the_service/controller/order_data_controller.dart';

class PickUpMethodUponDeliveryBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddADeliveryRepo>(
      () => AddADeliveryRepo(Get.find<ApiService>()),
    );
    Get.lazyPut(() => PickUpMethodUponDeliveryController());
    Get.lazyPut(() => OrderDataController());
  }
}
