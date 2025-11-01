import '../../../../features/home/controller/home_controller.dart';
import 'package:get/get.dart';
import '../../../../../core/helpers/constants.dart';
import '../../../routes/routes.dart';

class LoginRequiredBottomSheetController extends GetxController {
  final HomeController _homeController = Get.find();
  void login() {
    _homeController.selectedIndex.value = 0;
    Get.back();
    Get.toNamed(Routes.loginScreen, arguments: {AppConstants.resatAll: false});
  }
}
