import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/network/utils/api_result.dart';
import 'package:get/get.dart';
import '../../../helpers/app_shared_data.dart';
import '../../../helpers/constants.dart';
import '../../../network/utils/dio_factory.dart';
import '../../app_snackbar.dart';
import '../../app_snackbar_with_button.dart';
import 'app_delete_bottom_sheet_repo.dart';

class AppDeleteBottomSheetController extends GetxController {
  final AppDeleteBottomSheetRepo _deleteRepo =
      Get.find<AppDeleteBottomSheetRepo>();

  RxBool isButtonPressed = false.obs;

  deletaAccount() async {
    isButtonPressed.value = true;
    final result = await _deleteRepo.deleteAccount();
    result.when(
      success: (response) async {
        isButtonPressed.value = false;
        if (response.status == true) {
          await removeUserToken();
          isUserLogin = false;
          await AppSharedData.setUserLogin(false);

          AppSharedData.clearAllData();
          AppSharedData.clearAllSecuredData();

          showSnackbarWithButton(
            Get.context!,
            Get.context!.accountDeletedSuccessfully,
            AppConstants.success,
            showButton: false,
          );
          // Get.offAllNamed(Routes.loginScreen);
          Get.offAllNamed(
            Routes.loginScreen,
            arguments: {AppConstants.resatAll: true},
          );
        } else {
          showErrorSnackbar(Get.context!, response.message ?? '');
        }
      },
      failure: (error) {
        isButtonPressed.value = false;
        showSnackbarErrorApi(Get.context!, [error], null);
      },
    );
  }

  Future<void> removeUserToken() async {
    await AppSharedData.removeSecuredData(AppSharedKeys.userToken);

    DioFactory.setTokenIntoHeaderAfterLogin('');
  }
}
