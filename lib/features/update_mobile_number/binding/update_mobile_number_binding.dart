import '../../../../core/network/utils/api_service.dart';
import '../../../../features/auth/login/controller/login_controller.dart';
import '../../../../features/update_mobile_number/controller/update_mobile_number_controller.dart';
import '../../../../features/update_mobile_number/controller/update_mobile_repo.dart';
import 'package:get/get.dart';

class UpdateMobileNumberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdateMobileNumberController());
    Get.lazyPut<UpdateMobileRepo>(
      () => UpdateMobileRepo(Get.find<ApiService>()),
    );
    Get.lazyPut(() => LoginController());
  }
}
//sendCodeUpdateMobile