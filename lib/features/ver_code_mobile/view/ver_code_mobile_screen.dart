import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/general_screen_widget.dart';
import 'package:dazaha_app/features/auth/login/widgets/login_text_widget.dart';
import 'package:dazaha_app/features/auth/verification_code/widgets/did_send_code_widget.dart';
import 'package:dazaha_app/features/auth/verification_code/widgets/otp_input_widget%20.dart';
import 'package:dazaha_app/features/user_info/widgets/user_info_app_bar_widget.dart';

class VerCodeMobileScreen extends StatelessWidget {
  const VerCodeMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: UserInfoAppBarWidget(Height:  Width * 0.25,
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
            subTitle: '${context.enterTheDigitCode}\n+964 123 456 789',
          ),
          OtpInputWidget(context),
          verticalSpace(40.h),
          GeneralBottomAppWidget(
            context,
            text: context.verification,
            onTap: () {
              Get.offNamed(Routes.userInfoScreen);
            },
          ),
          verticalSpace(10.h),
          DidSendCodeWidget(context),
        ],
      ),
    );
  }
}
