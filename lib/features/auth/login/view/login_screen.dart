import 'dart:developer';
import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/helpers/app_shared_methods.dart';
import '../../../../core/widgets/app_loading_button.dart';
import '../../../../core/widgets/general_screen_widget.dart';
import '../../../../features/auth/login/controller/login_controller.dart';
import '../../../../features/auth/login/widgets/login_text_field_widget.dart';
import '../../../../features/auth/login/widgets/login_text_widget.dart';

class LoginScreen extends StatelessWidget {
  final bool? resatAll;

  LoginScreen({this.resatAll = true});
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    log('language is Arabic ${AppSharedMethods.isAppLanguageArabic()}');

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(
            () => AbsorbPointer(
              absorbing: _loginController.isProcessing.value,
              child: GeneralScreenWidget(
                context,
                wid: [
                  LoginTextWidget(
                    context,
                    title: context.login,
                    subTitle: context.enterMobileNumberToRegisterOrLogin,
                  ),
                  LoginTextFieldWidget(
                    context,
                    controller: _loginController.phoneController,
                  ),
                  verticalSpace(20.h),
                  Obx(() {
                    return AppLoadingButton(
                      text: context.continuation,
                      onPressed: () async {
                        _loginController.validateInput(context, resatAll);
                      },
                      isLoading: _loginController.isButtonPressed.value,
                      isWhiteProgress: true,
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
