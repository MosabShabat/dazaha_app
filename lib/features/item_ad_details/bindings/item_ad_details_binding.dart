import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/features/item_ad_details/controller/item_ad_details_controller.dart';

class ItemAdDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ItemAdDetailsController());
  }
}
