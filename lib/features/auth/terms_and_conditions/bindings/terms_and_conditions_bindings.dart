import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/network/utils/api_service.dart';
import '../../../../features/auth/terms_and_conditions/controller/app_info_repo.dart';
import '../../../../features/auth/terms_and_conditions/controller/terms_and_conditions_controller.dart';

class TermsAndConditionsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppInfoRepo>(() => AppInfoRepo(Get.find<ApiService>()));
    Get.lazyPut(() => TermsAndConditionsController());
  }
}
