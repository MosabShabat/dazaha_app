import '../../../core/constant/exports_libraries.dart';
import '../../../core/network/utils/api_result.dart';
import '../../../core/network/models/account/app_info.dart';
import '../../../core/widgets/app_snackbar.dart';
import 'captain_joins_repo.dart';

class CaptainJoinsController extends GetxController {
  final CaptainJoinsRepo _captainJoinsRepo = Get.find<CaptainJoinsRepo>();
  RxBool isLoading = true.obs;
  Rx<AppInfo>? joinAsDriverVar;
  @override
  void onInit() {
    super.onInit();
    joinAsDriver();
  }

  void joinAsDriver() async {
    isLoading.value = true;

    final result = await _captainJoinsRepo.joinAsDriver();

    result.when(
      success: (response) {
        isLoading.value = false;
        if (response.status == true) {
          if (response.data != null) {
            joinAsDriverVar = AppInfo.fromJson(
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
