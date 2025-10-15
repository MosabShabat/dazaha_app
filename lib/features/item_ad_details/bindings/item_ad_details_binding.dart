import '../../../core/network/utils/api_service.dart';
import 'package:get/get.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../../my_offer_ad_details/controller/my_offer_ad_details_controller.dart';
import '../../my_offer_ad_details/controller/offer_details_repo.dart';
import '../controller/item_ad_details_controller.dart';
import '../controller/item_ad_details_repo.dart';

class ItemAdDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ItemAdDetailsRepo(Get.find<ApiService>()));
    Get.lazyPut(() => OfferDetailsRepo(Get.find<ApiService>()));
    Get.lazyPut(() => MyOfferAdDetailsController());
    Get.lazyPut(() => ItemAdDetailsController());
    Get.lazyPut(() => OrderDataController());
  }
}
