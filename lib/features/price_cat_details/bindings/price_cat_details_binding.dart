import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/features/price_cat_details/controller/price_cat_details_controller.dart';

class PriceCatDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PriceCatDetailsController());
  }
}
