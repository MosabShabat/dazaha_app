import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/widgets/app_loading_button.dart';
import '../../../../core/widgets/def_app_bar_widget.dart';
import '../../../../core/widgets/general_screen_widget.dart';
import '../../../../features/auth/login/widgets/login_text_widget.dart';
import '../../../../features/auth/verification_code/controller/verification_code_controller.dart';
import '../../../../features/auth/verification_code/widgets/did_send_code_widget.dart';
import '../../../../features/auth/verification_code/widgets/otp_input_widget%20.dart';

class verificationCodeScreen extends StatelessWidget {
  final String phoneNumber;
  final bool resatAll;
  verificationCodeScreen({required this.phoneNumber, this.resatAll = true});
  final VerificationCodeController _verificationCodeController = Get.find();

  @override
  Widget build(BuildContext context) {
    _verificationCodeController.phoneNumber.value = phoneNumber;
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: DefAppBarWidget(context),
      body: SafeArea(
        child: GeneralScreenWidget(
          context,
          wid: [
            LoginTextWidget(
              context,
              title: context.verificationCode,
              subTitle:
                  '${context.enterTheDigitCode}\n${_verificationCodeController.phoneNumber.value}',
            ),
            OtpInputWidget(
              context,
              resatAll,
              controller: _verificationCodeController,
            ),
            verticalSpace(40.h),
            _buildContinueButton(context),
            verticalSpace(10.h),
            DidSendCodeWidget(context, controller: _verificationCodeController),
          ],
        ),
      ),
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: EdgeInsets.only(right: 0.w, left: 0.w, bottom: 24),
        child: AppLoadingButton(
          text: context.verification,
          onPressed: () async {
            _verificationCodeController.validateAndProceed(context, resatAll);
          },
          isLoading: _verificationCodeController.isButtonPressed.value,
          isWhiteProgress: true,
        ),
      );
    });
  }
}
