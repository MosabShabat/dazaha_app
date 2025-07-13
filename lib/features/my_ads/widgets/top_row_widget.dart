  import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/latest_announcements_widget.dart';
import 'package:dazaha_app/features/my_ads/widgets/filtering_bottom_sheet_widget.dart';

Widget TopRowWidget(BuildContext context) {
    return LatestAnnouncementsRowWidget(
            context,
            text: context.myAds,
            size: 20.sp,
            fontFamily: context.textStyles.titleLarge.bold.fontFamily,
            onPressed: () {
              FilteringBottomSheetWidget(context);
            },
            Widget: SvgPicture.asset(AppAssets.svgs.filter_icon),
          );
  }