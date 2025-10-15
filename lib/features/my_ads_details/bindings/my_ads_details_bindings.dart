import '../../../../features/my_ads_details/controller/my_ads_details_controller.dart';
import 'package:get/get.dart';
import '../../../core/network/utils/api_service.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../controller/my_ads_details_repo.dart';

class MyAdsDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyAdsDetailsRepo(Get.find<ApiService>()));
    Get.lazyPut(() => OrderDataController());
    Get.lazyPut(() => MyAdsDetailsController());
  }
}
