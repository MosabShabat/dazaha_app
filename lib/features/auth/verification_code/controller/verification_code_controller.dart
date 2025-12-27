import 'dart:async';
import 'dart:developer';
import 'dart:io';
// import 'package:pull_to_refresh/pull_to_refresh.dart';

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
// import '../../../document/controller/document_controller.dart';
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

  // 🔥 النسخة النهائية المصححة
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
        if (response.status == true) {
          isButtonPressed.value = false;

          final verificationModel = VerificationModel.fromJson(
            response.data as Map<String, dynamic>,
          );

          // المستخدم غير موجود → تسجيل جديد
          if (verificationModel.userExists == false) {
            Get.offAllNamed(
              Routes.registerScreen,
              arguments: {
                AppConstants.phoneNumber: phoneNumber.value,
                AppConstants.code: verificationModel.code,
              },
            );
            return;
          }

          try {
            // حفظ بيانات المستخدم
            await Future.wait([
              AppSharedData.setUserLogin(true),
              AppSharedData.setUserInfo(verificationModel.user!),
              saveUserToken(verificationModel.user?.token ?? ''),
            ]);

            // تحديث بيانات الصفحة الرئيسية
            if (Get.isRegistered<HomePageController>()) {
              final homeController = Get.find<HomePageController>();
              final _userStateController = Get.find<UserStateController>();

              homeController.loadCurrentUser();
              await homeController.getHome();

              _userStateController.updateFromUser(verificationModel.user!);
            }

            // الانتقال
            if (resetAll) {
              Get.offAllNamed(
                Routes.homeScreen,
                arguments: {'selectedIndex': 0},
              );
            } else {
              if (AppConstants.typeItemSelected == 'homeScreen3') {
                Get.offAllNamed(
                  Routes.homeScreen,
                  arguments: {'selectedIndex': 3},
                );
              } else {
                Get.close(2);
              }
            }
          } catch (e) {
            showErrorSnackbar(
              context,
              '$e',
              FirstColor: context.colorsCustom.redColor,
            );
          }
        } else {
          isButtonPressed.value = false;
          showErrorSnackbar(
            context,
            response.message ?? '',
            FirstColor: context.colorsCustom.redColor,
          );
        }
      },
      failure: (error) {
        isButtonPressed.value = false;
        showSnackbarErrorApi(context, [error], null);
      },
    );
  }

  // void _verificationCodeRequest(
  //   BuildContext context,
  //   String code,
  //   bool resetAll,
  // ) async {
  //   isButtonPressed.value = true;

  //   final result = await _verificationCodeRepo.verifyCode(
  //     phoneNumber.value,
  //     code,
  //     await AppSharedData.getSecuredString(AppSharedKeys.fcmTokenKey),
  //     Platform.isAndroid ? "android" : "ios",
  //   );

  //   result.when(
  //     success: (response) async {
  //       log(
  //         '${await AppSharedData.getSecuredString(AppSharedKeys.fcmTokenKey)}',
  //       );

  //       if (response.status == true) {
  //         isButtonPressed.value = false;

  //         final verificationModel = VerificationModel.fromJson(
  //           response.data as Map<String, dynamic>,
  //         );

  //         // 🔹 المستخدم غير موجود → انتقل لتسجيل جديد
  //         if (verificationModel.userExists == false) {
  //           Get.offAllNamed(
  //             Routes.registerScreen,
  //             arguments: {
  //               AppConstants.phoneNumber: phoneNumber.value,
  //               AppConstants.code: verificationModel.code,
  //             },
  //           );
  //           return;
  //         }

  //         // 🔹 المستخدم موجود → حفظ بيانات الدخول أولًا
  //         try {
  //           isUserLogin.value = true;
  //           // حفظ البيانات في التخزين الآمن بالتوازي
  //           await Future.wait([
  //             AppSharedData.setUserLogin(true),
  //             AppSharedData.setUserInfo(verificationModel.user!),
  //             saveUserToken(verificationModel.user?.token ?? ''),
  //           ]);

  //           // تحديث الكنترولر الخاص بالصفحة الرئيسية
  //           if (Get.isRegistered<HomePageController>()) {
  //             final RefreshController _localRefreshController =
  //                 RefreshController();

  //             final homeController = Get.find<HomePageController>();
  //             // await homeController.refreshAfterLogin();
  //             // await homeController.refreshData(
  //             //   '${homeController.latitude.value}',
  //             //   '${homeController.longitude.value}',
  //             // );

  //             await homeController.loadCurrentUser();
  //             await homeController.getHome(); // فقط مرة واحدة

  //             _localRefreshController.refreshCompleted();
  //           }

  //           // 🔹 الانتقال بعد اكتمال كل شيء
  //           if (resetAll) {
  //             Get.offAllNamed(
  //               Routes.homeScreen,
  //               arguments: {'selectedIndex': 0},
  //             );
  //           } else {
  //             if (AppConstants.typeItemSelected == 'homeScreen3') {
  //               Get.find<DocumentController>();
  //               Get.offAllNamed(
  //                 Routes.homeScreen,
  //                 arguments: {'selectedIndex': 3},
  //               );
  //             } else {
  //               Get.close(2);
  //             }
  //           }
  //         } catch (e) {
  //           log('Error while saving user data: $e');
  //           showErrorSnackbar(
  //             context,
  //             '${e}',
  //             FirstColor: context.colorsCustom.redColor,
  //           );
  //         }
  //       } else {
  //         isButtonPressed.value = false;
  //         showErrorSnackbar(
  //           context,
  //           response.message ?? '',
  //           FirstColor: context.colorsCustom.redColor,
  //         );
  //       }
  //     },
  //     failure: (error) {
  //       isButtonPressed.value = false;
  //       showSnackbarErrorApi(context, [error], null);
  //     },
  //   );
  // }
  Future<void> saveUserToken(String userToken) async {
    log('saveUserToken: $userToken');
    if (userToken.isEmpty) {
      debugPrint('User token is empty, not saving.');
      return;
    }

    await AppSharedData.setSecuredString(AppSharedKeys.userToken, userToken);
    DioFactory.setTokenIntoHeaderAfterLogin(userToken);
    debugPrint('User token saved: $userToken');
  }

  // Future<void> saveUserToken(String userToken) async {
  //   log('saveUserToken: $userToken');
  //   await AppSharedData.setSecuredString(AppSharedKeys.userToken, userToken);
  //   DioFactory.setTokenIntoHeaderAfterLogin(userToken);
  // }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
