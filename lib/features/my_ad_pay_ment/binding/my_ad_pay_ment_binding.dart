import 'package:dazaha_app/features/my_ad_pay_ment/controller/my_ad_pay_ment_controller.dart';
import 'package:get/get.dart';

class MyAdPayMentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyAdPayMentController());
  }
}
