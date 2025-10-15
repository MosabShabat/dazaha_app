import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/widgets/latest_announcements_widget.dart';
import '../../../../features/my_ads/widgets/filtering_bottom_sheet_widget.dart';

Widget TopRowWidget(
  BuildContext context, {
  required title,
  required size,
  required style,
  fontWeight,
  required GridList,
  required subTitle,
  required gridController,
  required orderDataController,
  s,
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
        gridList: GridList,
        subTitle: subTitle,
        gridController: gridController,
        orderDataController: orderDataController,
      );
    },
    Widget: SvgPicture.asset(AppAssets.svgs.filter_icon),
  );
}
