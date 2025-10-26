import 'package:get/get.dart';

import '../../../../../core/helpers/constants.dart';
import '../../../routes/routes.dart';

class LoginRequiredBottomSheetController extends GetxController {
  void login() {
    Get.back();
    Get.toNamed(Routes.loginScreen, arguments: {AppConstants.resatAll: false});
  }
}
