import '../../../constant/exports_widgets.dart';
import '../../../constant/exports_libraries.dart';
import '../../../theming/app_text_styles.dart';
import '../../app_loading_button.dart';
import '../../app_text_button.dart';
import '../../top_con_bot_sh_widget.dart';
import '../controller/app_delete_bottom_sheet_controller.dart';

class AppDeleteBottomSheetContent extends StatelessWidget {
  AppDeleteBottomSheetContent({super.key});

  late final AppDeleteBottomSheetController _appDeleteBottomSheetController;

  @override
  Widget build(BuildContext context) {
    _appDeleteBottomSheetController = Get.put(AppDeleteBottomSheetController());

    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(10.h),
              TopConBotShWidget(context).box.alignCenter.make(),
              verticalSpace(16.h),
              _buildHeader(context),
              verticalSpace(24.h),
              _buildCenterText(context),
              verticalSpace(24.h),
              _buildActionButtons(context),
              verticalSpace(16.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Text(
      context.DeleteMyAccount,
      style: context.textStyles.bodyLarge.medium.copyWith(
        color: context.colorsCustom.TextPrimary,
        fontSize: 14.sp,
      ),
    );
  }

  Widget _buildCenterText(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            context.deleteAccountConfirm,
            style: context.textStyles.bodyLarge.bold.copyWith(
              color: context.colorsCustom.TextPrimary,
              fontSize: 18.sp,
            ),
          ),
        ),
        verticalSpace(16),
        Center(
          child: Text(
            context.deleteDescription,
            textAlign: TextAlign.center,
            style: context.textStyles.bodyLarge.medium.copyWith(
              color: context.colorsCustom.TextSecondary,
              fontSize: 14.sp,
              height: 2.h,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          return AppLoadingButton(
            text: context.yesDelete,
            buttonColor: context.colorsCustom.redColor,
            onPressed: () async {
              _appDeleteBottomSheetController.deletaAccount();
            },
            isLoading: _appDeleteBottomSheetController.isButtonPressed.value,
            isWhiteProgress: true,
          );
        }),
        verticalSpace(12),
        AppTextButton(
          context,
          buttonText: context.no,
          onPressed: () => Get.back(),
          backgroundColor: context.colorsCustom.CardBackgroundLightGray,
          textStyle: AppTextStyles.font16Black500Medium(context),
        ),
      ],
    );
  }
}
