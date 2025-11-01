import '../../../../core/network/utils/api_result.dart';
import 'package:get/get.dart';

import '../../../core/constant/exports_libraries.dart';
import '../../../core/network/models/account/app_info.dart';
import '../../../core/widgets/app_snackbar.dart';
import 'delete_account_repo.dart';

class DeleteMyAccountController extends GetxController {
  final DeleteAccountRepo _deleteAccountRepo = Get.find<DeleteAccountRepo>();

  Rx<AppInfo>? appInfo;
  RxBool isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    deleteAccountInfo();
  }

  void deleteAccountInfo() async {
    isLoading.value = true;
    final result = await _deleteAccountRepo.deleteAccountInfo();
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
          showErrorSnackbar(
            Get.context!,
            response.message ?? '',
            FirstColor: Colors.red,
          );
        }
      },
      failure: (error) {
        isLoading.value = false;
        showSnackbarErrorApi(Get.context!, [error], null);
      },
    );
  }
}
