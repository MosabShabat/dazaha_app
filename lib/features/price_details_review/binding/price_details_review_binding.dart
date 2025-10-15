import '../../../../core/constant/exports_libraries.dart';
import '../../../../features/price_details_review/controller/price_details_review_controller.dart';
import '../../../core/network/utils/api_service.dart';
import '../../my_offer_ad_details/controller/my_offer_ad_details_controller.dart';
import '../../my_offer_ad_details/controller/offer_details_repo.dart';
import '../controller/rating_repo.dart';

class PriceDetailsReviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RatingRepo>(() => RatingRepo(Get.find<ApiService>()));
    Get.lazyPut(() => OfferDetailsRepo(Get.find<ApiService>()));
    Get.lazyPut(() => MyOfferAdDetailsController());
    Get.lazyPut(() => PriceDetailsReviewController());
  }
}
