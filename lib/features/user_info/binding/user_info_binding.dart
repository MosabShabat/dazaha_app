import 'package:dazaha_app/features/user_info/controller/user_info_controller.dart';
import 'package:get/get.dart';

class UserInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserInfoController(),);
  }
}
