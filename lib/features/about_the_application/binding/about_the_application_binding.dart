import '../../../../core/network/utils/api_service.dart';
import '../../../../features/about_the_application/controller/about_the_application_controller.dart';
import '../../../../features/auth/terms_and_conditions/controller/app_info_repo.dart';
import 'package:get/get.dart';

import '../../auth/terms_and_conditions/controller/terms_and_conditions_controller.dart';

class AboutTheApplicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppInfoRepo>(() => AppInfoRepo(Get.find<ApiService>()));
    Get.lazyPut(() => AboutTheApplicationController());
    Get.lazyPut(() => TermsAndConditionsController());
  }
}
