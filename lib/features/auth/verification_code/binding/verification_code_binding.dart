import '../../../../features/home_page/controller/home_repo.dart';

import '../../../../core/network/utils/api_service.dart';
import '../../../../features/auth/verification_code/controller/verification_code_controller.dart';
import '../../../../features/auth/verification_code/controller/verification_code_repo.dart';
import 'package:get/get.dart';

import '../../../document/controller/document_controller.dart';
import '../../../document/controller/document_repo.dart';
import '../../../home_page/controller/home_page_controller.dart';

class VerificationCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerificationCodeRepo>(
      () => VerificationCodeRepo(Get.find<ApiService>()),
    );
    Get.lazyPut(() => DocumentRepo(Get.find<ApiService>()));
    Get.lazyPut(() => HomeRepo(Get.find<ApiService>()));
    Get.lazyPut(() => VerificationCodeController());
    Get.lazyPut(() => HomePageController());
    Get.lazyPut(() => DocumentController());

    //HomePageController
  }
}
