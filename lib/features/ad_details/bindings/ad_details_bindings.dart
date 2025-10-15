import '../../../core/constant/exports_libraries.dart';
import '../../../features/ad_details/controller/ad_details_controller.dart';
import '../../../features/choose_the_service/controller/order_data_controller.dart';

import '../../../core/network/utils/api_service.dart';
import '../../add_a_delivery_address/controller/add_a_delivery_repo.dart';
import '../controller/ad_details_repo.dart';

class AdDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddADeliveryRepo>(
      () => AddADeliveryRepo(Get.find<ApiService>()),
    );
    Get.lazyPut<OrdersRepo>(() => OrdersRepo(Get.find<ApiService>()));
    //OrdersRepo
    Get.lazyPut(() => AdDetailsController());
    Get.lazyPut(() => OrderDataController());
  }
}
