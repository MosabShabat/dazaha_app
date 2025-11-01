import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/helpers/app_shared_data.dart';
import '../../../../core/helpers/app_shared_methods.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/network/models/auth/user_data.dart';
import '../../../../core/network/utils/api_result.dart';
import '../../../../core/network/utils/dio_factory.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../../../../features/auth/register/controller/register_repo.dart';

class RegisterController extends GetxController {
  final RegisterRepo _createAccountRepo = Get.find<RegisterRepo>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();

  var isChecked = false.obs;

  RxBool isButtonPressed = false.obs;
  void setChecked(bool value) {
    isChecked.value = value;
  }

  Future<bool> toggleChecked(BuildContext context) async {
    if (isChecked.value == false) {
      showErrorSnackbar(
        context,
        context.termsAndConditions,
        FirstColor: Colors.amber,
      );
      return false;
    } else {
      return true;
    }
  }

  void validationInputData(
    BuildContext context,
    String phoneNumber,
    String code,
    String fcmToken,
    String device,
  ) {
    if (_isFieldEmpty(firstNameController, context.enterFirstName, context))
      return;
    if (_isFieldEmpty(lastNameController, context.enterLastName, context))
      return;
    if (_isFieldEmpty(emailController, context.enterYourEmail, context)) return;

    if (isChecked.value == false) {
      showErrorSnackbar(
        context,
        context.termsAndConditions,
        FirstColor: Colors.amber,
      );
      return;
    }

    createAccountRequest(
      context,
      firstNameController.text,
      lastNameController.text,
      emailController.text,
      phoneNumber,
      code,
      fcmToken,
      device,
    );
  }

  bool _isFieldEmpty(
    TextEditingController controller,
    String errorMessage,
    BuildContext context,
  ) {
    if (AppSharedMethods.isTextFieldEmpty(controller)) {
      showErrorSnackbar(context, errorMessage, FirstColor: Colors.amber);
      return true;
    }
    return false;
  }

  void createAccountRequest(
    BuildContext context,
    String firstName,
    String lastName,
    String email,
    String phoneNumber,
    String code,
    String fcmToken,
    String device,
  ) async {
    isButtonPressed.value = true;
    final result = await _createAccountRepo.register(
      firstName,
      lastName,
      email,
      phoneNumber,
      code,
      fcmToken,
      device,
    );

    result.when(
      success: (response) async {
        isButtonPressed.value = false;
        if (response.status == true) {
          UserData userData = UserData.fromJson(
            response.data as Map<String, dynamic>,
          );
          userName = userData.firstName ?? '';
          isUserLogin.value = true;
          await AppSharedData.setUserLogin(true);
          await AppSharedData.setUserInfo(userData);
          await saveUserToken(userData.token ?? '');
          Get.offAllNamed(Routes.homeScreen); //

          // Get.offAllNamed(Routes.navigationBarScreen);
        } else {
          showErrorSnackbar(context, response.message ?? '',FirstColor: Colors.red);
        }
      },
      failure: (error) {
        isButtonPressed.value = false;
        showSnackbarErrorApi(context, [error], null);
      },
    );
  }
}

Future<void> saveUserToken(String userToken) async {
  await AppSharedData.setSecuredString(AppSharedKeys.userToken, userToken);
  DioFactory.setTokenIntoHeaderAfterLogin(userToken);
}
