import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/helpers/theme_exports.dart';
import 'package:dazaha_app/features/home_page/widgets/ads_details_widget.dart';
import 'package:dazaha_app/core/widgets/latest_announcements_widget.dart';

Widget CustomHomePageWidget(BuildContext context) {
  return Column(
    children: [
      LatestAnnouncementsRowWidget(
        context,
        text: context.latestAnnouncements,
        onPressed: () {},
        Widget: Text(
          context.viewAll,
          textAlign: TextAlign.end,
          style: context.textStyles.bodySmall.regular.copyWith(
            color: context.colorsCustom.TextPrimary,
            fontSize: 12.0.sp,
          ),
        ),
      ),
      AdsDetailsWidget(context),
    ],
  );
}
