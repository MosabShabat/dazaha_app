import 'package:dazaha_app/features/my_offer_ad_details/controller/my_offer_ad_details_controller.dart';
import 'package:get/get.dart';

class MyOfferAdDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>  MyOfferAdDetailsController(),);
  }
}
