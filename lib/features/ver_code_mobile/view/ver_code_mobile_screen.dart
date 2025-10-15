import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/widgets/general_screen_widget.dart';
import '../../../../features/auth/login/widgets/login_text_widget.dart';
import '../../../../features/auth/verification_code/widgets/did_send_code_widget.dart';
import '../../../../features/user_info/widgets/user_info_app_bar_widget.dart';
import '../../../../features/ver_code_mobile/controller/ver_code_mobile_controller.dart';
import '../../../core/widgets/app_loading_button.dart';
import '../../auth/verification_code/widgets/otp_input_widget .dart';

class VerCodeMobileScreen extends StatelessWidget {
  final String phoneNumber;
  final bool resatAll;
  VerCodeMobileScreen({required this.phoneNumber, this.resatAll = true});
  final VerCodeMobileController _verCodeController = Get.put(
    VerCodeMobileController(),
  );
  //VerCodeMobileController
  @override
  Widget build(BuildContext context) {
    _verCodeController.phoneNumber.value = phoneNumber;

    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: UserInfoAppBarWidget(
        Height: Width * 0.25,
        context,
        widget: Text(
          context.verificationCode,
          style: context.textStyles.bodyLarge.bold.copyWith(
            color: context.colorsCustom.TextPrimary,
            fontSize: 20.sp,
          ),
        ),
      ),

      body: GeneralScreenWidget(
        context,
        wid: [
          LoginTextWidget(
            context,
            title: context.verificationCode,
            subTitle:
                '${context.enterTheDigitCode}\n${_verCodeController.phoneNumber.value}+',
          ),
          OtpInputWidget(context, resatAll, controller: _verCodeController),
          verticalSpace(40.h),
          _buildContinueButton(context),
          verticalSpace(10.h),
          DidSendCodeWidget(context, controller: _verCodeController),
        ],
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
            _verCodeController.validateAndProceed(context, resatAll);
          },
          isLoading: _verCodeController.isButtonPressed.value,
          isWhiteProgress: true,
        ),
      );
    });
  }
}
