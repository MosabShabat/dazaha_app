import '../../../../core/network/utils/api_service.dart';
import '../../../../features/user_info/controller/user_info_repo.dart';
import '../../../../features/user_info/controller/user_info_controller.dart';
import 'package:get/get.dart';

import '../../profile/controller/profile_controller.dart';
import '../../profile/controller/profile_repo.dart';

class UserInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserInfoRepo>(() => UserInfoRepo(Get.find<ApiService>()));
    Get.lazyPut<ProfileRepo>(() => ProfileRepo(Get.find<ApiService>()));

    //ProfileController
    //ProfileRepo
    Get.lazyPut(() => UserInfoController());
    Get.lazyPut(() => ProfileController());
  }
}
