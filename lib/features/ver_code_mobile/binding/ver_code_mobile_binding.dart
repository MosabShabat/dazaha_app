import 'package:dazaha_app/features/ver_code_mobile/controller/ver_code_mobile_controller.dart';
import 'package:get/get.dart';

class VerCodeMobileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerCodeMobileController());
  }
}
