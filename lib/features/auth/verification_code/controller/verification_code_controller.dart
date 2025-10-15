import 'dart:async';
import 'dart:developer';
import 'dart:io';
import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/helpers/app_shared_data.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/network/models/auth/verification_model.dart';
import '../../../../core/network/utils/api_result.dart';
import '../../../../core/network/utils/dio_factory.dart';
import '../../../../core/services/notification_service.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../../../../features/auth/verification_code/controller/verification_code_repo.dart';

class VerificationCodeController extends GetxController {
  final VerificationCodeRepo _verificationCodeRepo =
      Get.find<VerificationCodeRepo>();

  var phoneNumber = ''.obs;
  RxString otpCode = ''.obs;
  RxBool isButtonPressed = false.obs;

  var timerText = '02:00'.obs;
  var isResendEnabled = false.obs;
  Timer? _timer;

  final FocusNode otpFocusNode = FocusNode();

  @override
  void onInit() async {
    super.onInit();
    startCountdown();
    await NotificationService().fetchAndStoreFCMToken();
    Future.delayed(Duration(milliseconds: 300), () {
      otpFocusNode.requestFocus();
    });
  }

  void updateOtpCode(String value) {
    otpCode.value = value;
  }

  void startCountdown() {
    var duration = Duration(minutes: 1);
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      duration = duration - Duration(seconds: 1);
      if (duration.inSeconds <= 0) {
        _timer?.cancel();
        isResendEnabled.value = true;
        timerText.value = '00:00';
      } else {
        timerText.value = formatDuration(duration);
      }
    });
  }

  String formatDuration(Duration duration) {
    String minutes = duration.inMinutes
        .remainder(60)
        .toString()
        .padLeft(2, '0');
    String seconds = duration.inSeconds
        .remainder(60)
        .toString()
        .padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void resendCode() {
    if (isResendEnabled.value) {
      startCountdown();
      isResendEnabled.value = false;
    }
  }

  bool validateOtp(String code) {
    return code.length == 4;
  }

  void validateAndProceed(BuildContext context, bool resetAll) {
    if (validateOtp(otpCode.value)) {
      _verificationCodeRequest(context, otpCode.value, resetAll);
    } else {
      showCustomSnackbar(
        context: context,
        svgIconPath: "assets/svgs/ic_error.svg",
        textTitle: context.error,
        text: 'Enter The Full Code',
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  void _verificationCodeRequest(
    BuildContext context,
    String code,
    bool resetAll,
  ) async {
    isButtonPressed.value = true;
    final result = await _verificationCodeRepo.verifyCode(
      phoneNumber.value,
      code,
      await AppSharedData.getSecuredString(AppSharedKeys.fcmTokenKey),
      Platform.isAndroid ? "android" : "ios",
    );

    result.when(
      success: (response) async {
        log(
          '${await AppSharedData.getSecuredString(AppSharedKeys.fcmTokenKey)}',
        );
        if (response.status == true) {
          isButtonPressed.value = false;
          VerificationModel verificationModel = VerificationModel.fromJson(
            response.data as Map<String, dynamic>,
          );
          if (verificationModel.userExists == false) {
            print('User does not exist, navigating to create account screen');
            Get.offAllNamed(
              Routes.registerScreen,
              arguments: {
                AppConstants.phoneNumber: phoneNumber.value,
                AppConstants.code: verificationModel.code,
              },
            );
          } else {
            // userName = verificationModel.user!.firstName ?? '';
            // userType = verificationModel.user!.isChef ?? 3;
            isUserLogin = true;
            await AppSharedData.setUserLogin(true);
            await AppSharedData.setUserInfo(verificationModel.user!);
            await saveUserToken(verificationModel.user?.token ?? '');

            if (resetAll == true) {
              Get.offAllNamed(Routes.homeScreen);
            } else {
              Get.close(2);
            }
          }
        } else {
          isButtonPressed.value = false;
          showErrorSnackbar(context, response.message ?? '');
        }
      },
      failure: (error) {
        isButtonPressed.value = false;
        showSnackbarErrorApi(context, [error], null);
      },
    );
  }

  Future<void> saveUserToken(String userToken) async {
    log('saveUserToken: $userToken');
    await AppSharedData.setSecuredString(AppSharedKeys.userToken, userToken);
    DioFactory.setTokenIntoHeaderAfterLogin(userToken);
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
