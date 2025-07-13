import 'package:dazaha_app/features/auth/verification_code/controller/verification_code_controller.dart';
import 'package:get/get.dart';

class VerificationCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerificationCodeController());
  }
}
