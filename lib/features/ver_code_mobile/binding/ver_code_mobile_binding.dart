import '../../../../features/ver_code_mobile/controller/ver_code_mobile_controller.dart';
import 'package:get/get.dart';
import '../../../core/network/utils/api_service.dart';
import '../controller/ver_code_repo.dart';

class VerCodeMobileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerCodeRepo>(() => VerCodeRepo(Get.find<ApiService>()));
    Get.lazyPut(() => VerCodeMobileController());
  }
}
//VerCodeRepo