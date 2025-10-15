import '../../../core/network/utils/api_service.dart';
import '../../../features/settings/controller/settings_controller.dart';
import 'package:get/get.dart';

import '../../profile/controller/profile_controller.dart';
import '../../profile/controller/profile_repo.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileRepo>(() => ProfileRepo(Get.find<ApiService>()));
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => SettingsController());
  }
}
