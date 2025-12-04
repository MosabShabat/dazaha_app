import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/widgets/custom_divider_widget.dart';
import '../../../../features/user_info/widgets/user_info_app_bar_widget.dart';
import '../../../../features/we_are_here_to_help/widgets/cus_list_tail_widget.dart';
import '../../../../features/we_are_here_to_help/widgets/thr_bottom_sheet_widget.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/widgets/login_required_bottom_sheet/view/login_required_bottom_sheet.dart';

class WeAreHereToHelpScreen extends StatelessWidget {
  final String username;

  const WeAreHereToHelpScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    final listItems = [
      {
        'title': context.liveSupport,
        'icon': AppAssets.svgs.music_play_icon,
        'onTap': () {
          if (AppConstants.userToken.isNotEmpty &&
              AppConstants.userToken != '' &&
              AppConstants.userUUid.isNotEmpty &&
              AppConstants.userUUid != '') {
            Get.toNamed(
              Routes.reportAProblemChatSupportScreen,
              arguments: {
                AppConstants.liveSupport: true,
                AppConstants.uuid: 'technical_support',
                AppConstants.receiverImage: 'image_url',
                AppConstants.receiverName: '${context.liveSupport}',
                AppConstants.receiverVerify: true,
              },
            );
          } else {
            showLoginRequiredBottomSheet(Get.context!);
          }
        },
      },
      {
        'title': context.reportAProblem,
        'icon': AppAssets.svgs.lifebuoy_icon,
        'onTap': () {
          if (AppConstants.userToken.isNotEmpty &&
              AppConstants.userToken != '' &&
              AppConstants.userUUid.isNotEmpty &&
              AppConstants.userUUid != '') {
            Get.toNamed(
              Routes.reportAProblemScreen,
              arguments: {'referenceType': '', 'referenceUuid': ''},
            );
          } else {
            showLoginRequiredBottomSheet(Get.context!);
          }
        },
      },
      {
        'title': context.frequentlyAskedQuestions,
        'icon': AppAssets.svgs.lifebuoy_icon,
        'onTap': () => ThrBottomSheetWidget(context),
      },
    ];

    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: UserInfoAppBarWidget(
        Height: Width * 0.33,
        context,
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              username,
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
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40.h),
        child: Column(
          children: List.generate(listItems.length * 2 - 1, (index) {
            if (index.isEven) {
              final item = listItems[index ~/ 2];
              return CusListTailWidget(
                context,
                title: item['title'] as String,
                iconImg: item['icon'] as String,
                onTap: item['onTap'] as VoidCallback,
              );
            } else {
              return CustomDividerWidget(context);
            }
          }),
        ),
      ),
    );
  }
}
