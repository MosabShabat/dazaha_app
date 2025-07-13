import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/helpers/theme_exports.dart';
import 'package:dazaha_app/features/home_page/widgets/details_container_widget.dart';
import 'package:dazaha_app/core/widgets/latest_announcements_widget.dart';

Widget BottomCustomWidget(BuildContext context) {
  return Column(
    children: [
      LatestAnnouncementsRowWidget(
        context,
        text: context.trackingLog,
        onPressed: () {},
        Widget: Text(
          context.viewAll,
          style: context.textStyles.bodySmall.regular.copyWith(
            color: context.colorsCustom.TextSecondary,
            fontSize: 12.sp,
          ),
        ),
      ),
      DetailsContainerWidget(context),
    ],
  );
}
