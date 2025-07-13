import 'package:dazaha_app/features/my_ads_details/controller/my_ads_details_controller.dart';
import 'package:get/get.dart';

class MyAdsDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyAdsDetailsController());
  }
}
