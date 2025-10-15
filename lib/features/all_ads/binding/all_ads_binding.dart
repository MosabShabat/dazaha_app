import 'package:get/get.dart';
import '../../../core/network/utils/api_service.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../controller/all_ads_controller.dart';
import '../controller/all_ads_repo.dart';

class AllAdsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AllAdsRepo(Get.find<ApiService>()));
    Get.lazyPut(() => AllAdsController());
    Get.lazyPut(() => OrderDataController());
  }
}
