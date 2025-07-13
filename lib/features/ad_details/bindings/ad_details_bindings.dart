import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/features/ad_details/controller/ad_details_controller.dart';

class AdDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdDetailsController());
  }
}
