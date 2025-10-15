import 'dart:async';
import '../../../../../core/constant/exports_libraries.dart';
import '../../../../../core/constant/exports_widgets.dart';
import '../../../../../core/network/utils/api_result.dart';
import '../../../../../core/widgets/app_snackbar.dart';
import '../../../../../features/ver_code_mobile/controller/ver_code_repo.dart';

class VerCodeMobileController extends GetxController {
  final VerCodeRepo _verificationCodeRepo = Get.find<VerCodeRepo>();
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
      _verCodeRequest(context, otpCode.value, resetAll);
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

  void _verCodeRequest(BuildContext context, String code, bool resetAll) async {
    isButtonPressed.value = true;
    final result = await _verificationCodeRepo.verifyCode(
      phoneNumber.value,
      code,
    );

    result.when(
      success: (response) async {
        if (response.status == true) {
          isButtonPressed.value = false;
          {
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

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
