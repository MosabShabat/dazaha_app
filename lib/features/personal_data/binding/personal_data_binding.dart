import '../../../../features/personal_data/controller/personal_data_controller.dart';
import 'package:get/get.dart';

import '../../../core/network/utils/api_service.dart';
import '../../auth/register/controller/register_controller.dart';
import '../../auth/register/controller/register_repo.dart';
import '../../profile/controller/profile_controller.dart';
import '../../profile/controller/profile_repo.dart';
import '../../user_info/controller/user_info_controller.dart';
import '../../user_info/controller/user_info_repo.dart';
import '../controller/personal_data_repo.dart';

class PersonalDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserInfoRepo>(() => UserInfoRepo(Get.find<ApiService>()));
    Get.lazyPut<ProfileRepo>(() => ProfileRepo(Get.find<ApiService>()));
    Get.lazyPut<RegisterRepo>(() => RegisterRepo(Get.find<ApiService>()));
    Get.lazyPut<PersonalDataRepo>(
      () => PersonalDataRepo(Get.find<ApiService>()),
    );

    Get.lazyPut(() => RegisterController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => PersonalDataController());
    Get.lazyPut(() => UserInfoController());

    //PersonalDataRepo
  }
}
