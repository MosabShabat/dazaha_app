import 'package:dazaha_app/features/all_ads/controller/all_ads_controller.dart';
import 'package:get/get.dart';

class AllAdsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AllAdsController());
  }
}
