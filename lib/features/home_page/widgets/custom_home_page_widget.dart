import '../../../core/constant/exports_libraries.dart';
import '../../../core/helpers/theme_exports.dart';
import '../../../core/routes/routes.dart';
import '../../../features/home_page/widgets/ads_details_widget.dart';
import '../../../core/widgets/latest_announcements_widget.dart';

Widget CustomHomePageWidget(BuildContext context, {controller}) {
  return Column(
    children: [
      LatestAnnouncementsRowWidget(
        context,
        text: context.latestAnnouncements,
        onPressed: () {
          Get.toNamed(Routes.allAdsScreen);
        },
        Widget: Text(
          context.viewAll,
          textAlign: TextAlign.end,
          style: context.textStyles.bodySmall.regular.copyWith(
            color: context.colorsCustom.TextPrimary,
            fontSize: 12.0.sp,
          ),
        ),
      ),
      AdsDetailsWidget(context, controller: controller),
    ],
  );
}
