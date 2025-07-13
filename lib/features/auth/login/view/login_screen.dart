import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/widgets/general_screen_widget.dart';
import 'package:dazaha_app/features/auth/login/widgets/login_text_field_widget.dart';
import 'package:dazaha_app/features/auth/login/widgets/login_text_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      body: SafeArea(
        child: GeneralScreenWidget(
          context,
          wid: [
            LoginTextWidget(
              context,
              title: context.login,
              subTitle: context.enterMobileNumberToRegisterOrLogin,
            ),
            LoginTextFieldWidget(context),
            verticalSpace(20.h),
            GeneralBottomAppWidget(
              context,
              text: context.continuation,
              onTap: () {
                Get.toNamed(Routes.verificationCodeScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
