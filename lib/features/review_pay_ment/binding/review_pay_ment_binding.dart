import 'package:dazaha_app/features/review_pay_ment/controller/review_pay_ment_controller.dart';
import 'package:get/get.dart';

class ReviewPayMentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReviewPayMentController());
  }
}
