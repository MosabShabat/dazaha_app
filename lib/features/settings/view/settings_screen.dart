import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../core/widgets/custom_divider_widget.dart';
import '../../profile/controller/profile_controller.dart';
import '../../user_info/widgets/user_info_app_bar_widget.dart';
import '../../we_are_here_to_help/widgets/cus_list_tail_widget.dart';
import '../widgets/language_list_tail_widget.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  final ProfileController profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: UserInfoAppBarWidget(
        Height: Width * 0.25,
        context,
        widget: Text(
          context.settings,
          style: context.textStyles.bodyLarge.bold.copyWith(
            color: context.colorsCustom.TextPrimary,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
        child: Column(
          children: [
            verticalSpace(50.h),
            LanguageListTailWidget(
              context,
              profileController: profileController,
            ).paddingSymmetric(horizontal: 16.w),
            verticalSpace(20.h),
            CustomDividerWidget(context),
            verticalSpace(20.h),
            CusListTailWidget(
              context,
              title: context.DeleteMyAccount,
              iconImg: AppAssets.svgs.trash_icon,
              onTap: () {
                Get.toNamed(Routes.deleteMyAccountScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
//ProfileListTailWidget