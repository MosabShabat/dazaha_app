import 'package:dazaha_app/features/summary_my_ad_det/controller/summary_my_ad_det_controller.dart';
import 'package:get/get.dart';

class SummaryMyAdDetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SummaryMyAdDetController(),);
  }
}
