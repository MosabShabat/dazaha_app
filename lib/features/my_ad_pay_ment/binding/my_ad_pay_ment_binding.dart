import '../../../core/network/utils/api_service.dart';
import '../../../features/my_ad_pay_ment/controller/my_ad_pay_ment_controller.dart';
import 'package:get/get.dart';
import '../controller/my_ad_pay_ment_repo.dart';

class MyAdPayMentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyAdPayMentRepo(Get.find<ApiService>()));
    Get.lazyPut(() => MyAdPayMentController());
  }
}
