import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/custom_divider_widget.dart';
import 'package:dazaha_app/features/user_info/widgets/user_info_app_bar_widget.dart';
import 'package:dazaha_app/features/we_are_here_to_help/widgets/cus_list_tail_widget.dart';
import 'package:dazaha_app/features/we_are_here_to_help/widgets/thr_bottom_sheet_widget.dart';

class WeAreHereToHelpScreen extends StatelessWidget {
  const WeAreHereToHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: UserInfoAppBarWidget(
        Height: Width * 0.33,
        context,
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'أهلا ، Mohammed Issa',
              style: context.textStyles.bodySmall.regular.copyWith(
                color: context.colorsCustom.TextPrimary,
              ),
            ),
            verticalSpace(10.h),
            Text(
              context.weAreHereToHelp,
              style: context.textStyles.bodyLarge.bold.copyWith(
                color: context.colorsCustom.TextPrimary,
                fontSize: 20.sp,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          verticalSpace(40.h),
          CusListTailWidget(
            context,
            title: context.liveSupport,
            iconImg: AppAssets.svgs.music_play_icon,
            onTap: () {
              Get.toNamed(Routes.reportAProblemChatSupportScreen);
            },
          ),
          CustomDividerWidget(context),
          verticalSpace(10.h),
          CusListTailWidget(
            context,
            title: context.reportAProblem,
            iconImg: AppAssets.svgs.lifebuoy_icon,
            onTap: () {
              Get.toNamed(Routes.reportAProblemScreen);
            },
          ),
          CustomDividerWidget(context),
          verticalSpace(10.h),
          CusListTailWidget(
            context,
            title: context.frequentlyAskedQuestions,
            iconImg: AppAssets.svgs.lifebuoy_icon,
            onTap: () {
              ThrBottomSheetWidget(context);
            },
          ),
        ],
      ),
    );
  }
}
