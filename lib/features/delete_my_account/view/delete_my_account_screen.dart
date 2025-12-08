import 'package:flutter_html/flutter_html.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/constant/exports_libraries.dart';
import '../../../core/theming/app_text_styles.dart';
import '../../../core/widgets/app_delete_bottom_sheet/view/app_delete_bottom_sheet.dart';
import '../../../core/widgets/app_shimmers/custom_shimmer.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../user_info/widgets/user_info_app_bar_widget.dart';
import '../controller/delete_my_account_controller.dart';

class DeleteMyAccountScreen extends StatelessWidget {
  DeleteMyAccountScreen({super.key});
  final DeleteMyAccountController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: UserInfoAppBarWidget(
        context,
        Height: context.screenWidth * 0.25,
        backgroundColor: context.colorsCustom.redColor.withOpacity(0.15),
        widget: Text(
          context.DeleteMyAccount,
          style: context.textStyles.bodyLarge.bold.copyWith(
            color: context.colorsCustom.TextPrimary,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Obx(
                  () => _controller.isLoading.isTrue
                      ? CustomShimmer(width: double.infinity, height: 360.h)
                      : SingleChildScrollView(
                          child: Html(
                            data: _controller.appInfo?.value.description ?? '',
                            style: {
                              "*": Style(
                                fontFamily: 'Tajawal',
                                fontSize: FontSize(14),
                              ),
                            },
                          ),
                        ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 46.h),
              child: AppTextButton(
                context,
                buttonText: context.DeleteMyAccount,
                onPressed: () => showAppDeleteBottomSheet(context),
                backgroundColor: context.colorsCustom.surfacePrimaryBlack,
                textStyle: AppTextStyles.font16White500Medium(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
