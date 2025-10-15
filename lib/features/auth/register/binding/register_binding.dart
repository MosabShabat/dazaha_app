import '../../../../core/network/utils/api_service.dart';
import '../../../../features/auth/register/controller/register_repo.dart';
import '../../../../features/auth/register/controller/register_controller.dart';
import 'package:get/get.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterRepo>(() => RegisterRepo(Get.find<ApiService>()));
    Get.lazyPut(() => RegisterController());
  }
}
