import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/latest_announcements_widget.dart';
import 'package:dazaha_app/features/my_ads/widgets/filtering_bottom_sheet_widget.dart';

Widget TopRowWidget(
  BuildContext context, {
  required title,
  required size,
  required style,
  fontWeight,
  required GridList,
  required subTitle,
}) {
  return LatestAnnouncementsRowWidget(
    context,
    text: title,
    size: size,
    fontFamily: style,
    fontWeight: fontWeight,
    onPressed: () {
      FilteringBottomSheetWidget(
        context,
        GridList: GridList,
        subTitle: subTitle,
      );
    },
    Widget: SvgPicture.asset(AppAssets.svgs.filter_icon),
  );
}
