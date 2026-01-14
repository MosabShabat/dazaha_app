import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/widgets/app_loading_button.dart';
// import '../../../../core/widgets/bottom_navigation_bar_widget.dart';
import '../../../../core/widgets/general_screen_widget.dart';
import '../../../../features/auth/login/widgets/login_text_field_widget.dart';
import '../../../../features/update_mobile_number/controller/update_mobile_number_controller.dart';
import '../../../../features/user_info/widgets/user_info_app_bar_widget.dart';
import '../../../core/constant/exports_libraries.dart';

class UpdateMobileNumberScreen extends StatelessWidget {
  final bool? resatAll;

  UpdateMobileNumberScreen({this.resatAll = true});
  final UpdateMobileNumberController _updateMobileNumberController = Get.put(
    UpdateMobileNumberController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: UserInfoAppBarWidget(
        Height: Width * 0.25,
        context,
        widget: Text(
          context.updateMobileNumber,
          style: context.textStyles.bodyLarge.bold.copyWith(
            color: context.colorsCustom.TextPrimary,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: Obx(
        () => AbsorbPointer(
          absorbing: _updateMobileNumberController.isProcessing.value,
          child: GeneralScreenWidget(
            context,
            wid: [
              Text(
                context.enterTheNewMobileNumberToUpdate,
                style: context.textStyles.bodyMedium.medium.copyWith(
                  color: context.colorsCustom.TextSecondary,
                ),
              ),
              verticalSpace(20.h),
              LoginTextFieldWidget(
                context,
                readOnly: false,
                textAlign: 'null',
                controller: _updateMobileNumberController.phoneController,
              ),
              verticalSpace(40.h),
              Obx(() {
                return AppLoadingButton(
                  text: context.continuation,
                  onPressed: () async {
                    _updateMobileNumberController.validateInput(
                      context,
                      resatAll,
                    );
                  },
                  isLoading:
                      _updateMobileNumberController.isButtonPressed.value,
                  isEnabled:
                      !_updateMobileNumberController.isButtonPressed.value,

                  isWhiteProgress: true,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
