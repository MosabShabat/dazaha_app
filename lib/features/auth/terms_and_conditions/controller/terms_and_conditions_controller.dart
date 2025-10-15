import '../../../../core/network/utils/api_result.dart';
import 'package:get/get.dart';
import '../../../../core/network/models/account/app_info.dart';
import '../../../../core/widgets/app_snackbar.dart';
import 'app_info_repo.dart';

class TermsAndConditionsController extends GetxController {
  final AppInfoRepo _appInfoRepo = Get.find<AppInfoRepo>();

  Rx<AppInfo>? appInfo;
  RxBool isLoading = true.obs;

  void aboutApp() async {
    isLoading.value = true;
    final result = await _appInfoRepo.aboutApp();
    result.when(
      success: (response) {
        isLoading.value = false;
        if (response.status == true) {
          if (response.data != null) {
            appInfo = AppInfo.fromJson(
              response.data as Map<String, dynamic>,
            ).obs;
          } else {
            showSnackbarErrorApi(Get.context!, response.errors ?? [], null);
          }
        } else {
          isLoading.value = false;
          showErrorSnackbar(Get.context!, response.message ?? '');
        }
      },
      failure: (error) {
        isLoading.value = false;
        showSnackbarErrorApi(Get.context!, [error], null);
      },
    );
  }

  void privacyPolicy() async {
    isLoading.value = true;
    final result = await _appInfoRepo.privacyPolicy();
    result.when(
      success: (response) {
        isLoading.value = false;
        if (response.status == true) {
          if (response.data != null) {
            appInfo = AppInfo.fromJson(
              response.data as Map<String, dynamic>,
            ).obs;
          } else {
            showSnackbarErrorApi(Get.context!, response.errors ?? [], null);
          }
        } else {
          isLoading.value = false;
          showErrorSnackbar(Get.context!, response.message ?? '');
        }
      },
      failure: (error) {
        isLoading.value = false;
        showSnackbarErrorApi(Get.context!, [error], null);
      },
    );
  }

  void termsConditions() async {
    isLoading.value = true;
    final result = await _appInfoRepo.termsConditions();
    result.when(
      success: (response) {
        isLoading.value = false;
        if (response.status == true) {
          if (response.data != null) {
            appInfo = AppInfo.fromJson(
              response.data as Map<String, dynamic>,
            ).obs;
          } else {
            showSnackbarErrorApi(Get.context!, response.errors ?? [], null);
          }
        } else {
          isLoading.value = false;
          showErrorSnackbar(Get.context!, response.message ?? '');
        }
      },
      failure: (error) {
        isLoading.value = false;
        showSnackbarErrorApi(Get.context!, [error], null);
      },
    );
  }
}
