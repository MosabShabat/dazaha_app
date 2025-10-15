import '../../../../core/network/utils/api_service.dart';
import '../../../../features/auth/login/controller/login_repo.dart';
import 'package:get/get.dart';
import '../controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginRepo>(() => LoginRepo(Get.find<ApiService>()));
    Get.lazyPut(() => LoginController());
  }
}
