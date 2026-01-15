import '../../../../features/my_offer_ad_details/controller/my_offer_ad_details_controller.dart';
import 'package:get/get.dart';

import '../../../core/network/utils/api_service.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
// import '../../item_ad_details/controller/item_ad_details_controller.dart';
// import '../../item_ad_details/controller/item_ad_details_repo.dart';
import '../../my_ads/controller/transportation_and_delivery_controller.dart';
import '../../my_ads_details/controller/my_ads_details_controller.dart';
import '../controller/offer_details_repo.dart';

class MyOfferAdDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OfferDetailsRepo(Get.find<ApiService>()));
    Get.lazyPut(() => MyOfferAdDetailsController());
    Get.lazyPut(() => MyAdsDetailsController());
    Get.lazyPut(() => TransportationAndDeliveryController());

    //Get.put(TransportationAndDeliveryController())
    Get.lazyPut(() => OrderDataController());
  }
}
