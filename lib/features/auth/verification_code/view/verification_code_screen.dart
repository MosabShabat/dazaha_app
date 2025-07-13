import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/def_app_bar_widget.dart';
import 'package:dazaha_app/core/widgets/general_screen_widget.dart';
import 'package:dazaha_app/features/auth/login/widgets/login_text_widget.dart';
import 'package:dazaha_app/features/auth/verification_code/widgets/did_send_code_widget.dart';
import 'package:dazaha_app/features/auth/verification_code/widgets/otp_input_widget%20.dart';

class verificationCodeScreen extends StatelessWidget {
  const verificationCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              subTitle: '${context.enterTheDigitCode}\n+964 123 456 789',
            ),
            OtpInputWidget(context),
            verticalSpace(40.h),
            GeneralBottomAppWidget(
              context,
              text: context.verification,
              onTap: () {
                Get.toNamed(Routes.registerScreen);
              },
            ),
            verticalSpace(10.h),
            DidSendCodeWidget(context),
          ],
        ),
      ),
    );
  }
}
