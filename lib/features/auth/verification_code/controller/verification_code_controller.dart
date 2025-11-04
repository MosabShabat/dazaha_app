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
import '../../../home_page/controller/home_page_controller.dart';

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
      showErrorSnackbar(
        context,
        context.enterTheFullCode,
        FirstColor: Colors.amber,
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
            Get.offAllNamed(
              Routes.registerScreen,
              arguments: {
                AppConstants.phoneNumber: phoneNumber.value,
                AppConstants.code: verificationModel.code,
              },
            );
          } else {
            isUserLogin.value = true;

            // تنفيذ هذه العمليات بشكل غير متزامن
            unawaited(AppSharedData.setUserLogin(true));
            unawaited(AppSharedData.setUserInfo(verificationModel.user!));
            unawaited(saveUserToken(verificationModel.user?.token ?? ''));

            // انتقل أولًا، ثم قم بالتحديث في الخلفية
            if (resetAll) {
              Get.offAllNamed(
                Routes.homeScreen,
                arguments: {'selectedIndex': 0},
              );
              Future.microtask(() async {
                if (Get.isRegistered<HomePageController>()) {
                  final homeController = Get.find<HomePageController>();
                  await homeController.refreshAfterLogin();
                }
              });
            } else {
              Get.close(2);
            }
          }
        }
        // if (response.status == true) {
        //   isButtonPressed.value = false;
        //   VerificationModel verificationModel = VerificationModel.fromJson(
        //     response.data as Map<String, dynamic>,
        //   );
        //   if (verificationModel.userExists == false) {
        //     Get.offAllNamed(
        //       Routes.registerScreen,
        //       arguments: {
        //         AppConstants.phoneNumber: phoneNumber.value,
        //         AppConstants.code: verificationModel.code,
        //       },
        //     );
        //   } else {
        //     // حفظ حالة تسجيل الدخول
        //     isUserLogin.value = true;
        //     await AppSharedData.setUserLogin(true);
        //     await AppSharedData.setUserInfo(verificationModel.user!);
        //     // حفظ التوكن
        //     await saveUserToken(verificationModel.user?.token ?? '');
        //     // تحديث HomePageController بعد تسجيل الدخول
        //     if (Get.isRegistered<HomePageController>()) {
        //       final homeController = Get.find<HomePageController>();
        //       await homeController.refreshAfterLogin();
        //     }
        //     //
        //     if (resetAll) {
        //       Get.offAllNamed(
        //         Routes.homeScreen,
        //         arguments: {'selectedIndex': 0},
        //       );
        //     } else {
        //       Get.close(2);
        //     }
        //   }
        // }
        else {
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
