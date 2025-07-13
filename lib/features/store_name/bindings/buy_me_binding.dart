import 'package:dazaha_app/features/store_name/controller/buy_me_controller.dart';
import 'package:get/get.dart';

class BuyMeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BuyMeController());
  }
}
