import 'dart:io';
import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/helpers/app_shared_data.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/widgets/app_loading_button.dart';
import '../../../../core/widgets/def_app_bar_widget.dart';
import '../../../../core/widgets/general_screen_widget.dart';
import '../../../../features/auth/register/widgets/check_box_list_tail_widget.dart';
import '../../../../features/auth/register/widgets/in_put_data_widget.dart';
import '../../../../features/auth/register/controller/register_controller.dart';

class RegisterScreen extends StatelessWidget {
  final String phoneNumber;
  final String code;
  RegisterScreen({super.key, required this.phoneNumber, required this.code});

  final RegisterController _registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    AppConstants.statusBar();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: DefAppBarWidget(
        context,
        routeName: Routes.loginScreen,
        navigationType: AppNavigationType.offAllNamed,
      ),
      bottomNavigationBar: _buildCreateAccountButton(context),
      body: GeneralScreenWidget(
        context,
        wid: [
          verticalSpace(20.h),
          Text(
            context.registerNewUser,
            style: context.textStyles.headlineSmall.bold.copyWith(
              color: context.colorsCustom.surfacePrimaryBlack,
            ),
          ),
          verticalSpace(40.h),
          InPutDataWidget(
            context,
            firstNameController: _registerController.firstNameController,
            lastNameController: _registerController.lastNameController,
            emailController: _registerController.emailController,
          ),
          CheckBoxListTailWidget(context),
          verticalSpace(0.18.sh),
        ],
      ),
    );
  }

  Widget _buildCreateAccountButton(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Padding(
          padding: EdgeInsets.only(right: 16.w, left: 16.w, bottom: 24),
          child: AppLoadingButton(
            text: context.registerAnAccount,
            onPressed: () async {
              _registerController.validationInputData(
                context,
                phoneNumber,
                code,
                await AppSharedData.getSecuredString(AppSharedKeys.fcmTokenKey),
                Platform.isAndroid ? "android" : "ios",
              );
            },
            isLoading: _registerController.isButtonPressed.value,
            isEnabled: !_registerController.isButtonPressed.value,
            isWhiteProgress: true,
          ),
        );
      }),
    );
  }
}
