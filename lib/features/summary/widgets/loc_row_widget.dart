  import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget LocRowWidget(BuildContext context) {
    return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(AppAssets.svgs.location_icon_summary),
            horizontalSpace(5.w),
            Text(
              'مول المنصور',
              textAlign: TextAlign.start,
              maxLines: 1,
              style: context.textStyles.titleMedium.medium.copyWith(
                color: context.colorsCustom.TealGreenSecondary,
                fontSize: 16.sp,
              ),
            ),
          ],
        );
  }