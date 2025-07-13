import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/features/price_details_review/controller/price_details_review_controller.dart';

class PriceDetailsReviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PriceDetailsReviewController());
  }
}
