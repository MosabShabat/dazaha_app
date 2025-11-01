import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/helpers/app_shared_methods.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/network/utils/api_result.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../../../../features/auth/login/controller/login_repo.dart';

class LoginController extends GetxController {
  final LoginRepo _loginRepo = Get.find<LoginRepo>();

  final TextEditingController phoneController = TextEditingController();
  final String countryCode = "964";

  RxBool isButtonPressed = false.obs;
  var isProcessing = false.obs;

  onInit() {
    super.onInit();
    isOpenBefore = true;
  }

  void validateInput(BuildContext context, bool? resetAll) {
    if (_isPhoneNumberEmpty()) {
      showErrorSnackbar(
        context,
        context.enterPhoneNumber,
        FirstColor: Colors.amber,
      );
      return;
    }
    if (!_isValidPhoneNumber()) {
      showErrorSnackbar(
        context,
        context.enterPhoneNumber,
        FirstColor: Colors.amber,
      );
      return;
    }
    String phoneNumber = '$countryCode-${phoneController.text}';

    _sendCodeRequest(context, phoneNumber, resetAll!);
  }

  bool _isPhoneNumberEmpty() {
    return AppSharedMethods.isTextFieldEmpty(phoneController);
  }

  bool _isValidPhoneNumber() {
    return GetUtils.isPhoneNumber(phoneController.text);
  }

  void _sendCodeRequest(
    BuildContext context,
    String phoneNumber,
    bool resetAll,
  ) async {
    isButtonPressed.value = true;
    isProcessing.value = true;

    final result = await _loginRepo.senCode(phoneNumber);
    result.when(
      success: (response) async {
        if (response.status == true) {
          isButtonPressed.value = false;
          isProcessing.value = false; // ← مهم جداً

          isOpenBefore = true;
          Get.toNamed(
            Routes.verificationCodeScreen,
            arguments: {
              AppConstants.phoneNumber: phoneNumber,
              AppConstants.resatAll: resetAll,
            },
          );
          isButtonPressed.value = false;
          isProcessing.value = false;
        } else {
          isButtonPressed.value = false;
          isProcessing.value = false;

          showErrorSnackbar(context, response.message ?? '', FirstColor: Colors.red,);
        }
      },
      failure: (error) {
        isButtonPressed.value = false;
        isProcessing.value = false;

        showSnackbarErrorApi(context, [error], null);
      },
    );
  }

  @override
  void onClose() {
    isButtonPressed.value = false;
    isProcessing.value = false;
    phoneController.clear();
    super.onClose();
  }
}
