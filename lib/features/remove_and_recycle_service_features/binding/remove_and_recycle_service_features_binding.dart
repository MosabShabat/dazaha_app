import '../../../core/network/utils/api_service.dart';
import '../../../features/remove_and_recycle_service_features/controller/remove_and_recycle_service_features_controller.dart';
import 'package:get/get.dart';

import '../../choose_the_service/controller/choose_the_service_controller.dart';
import '../../choose_the_service/controller/choose_the_service_repo.dart';
import '../../choose_the_service/controller/order_data_controller.dart';

class RemoveAndRecycleServiceFeaturesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChooseTheServiceRepo(Get.find<ApiService>()));
    Get.lazyPut(() => OrderDataController());
    Get.lazyPut(() => ChooseTheServiceController());
    Get.lazyPut(() => RemoveAndRecycleServiceFeaturesController());
  }
}
