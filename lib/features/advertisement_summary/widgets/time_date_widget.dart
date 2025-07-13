import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/advertisement_summary/widgets/time_date_column_widget.dart';

Widget TimeDateWidget(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        context.convenientTimeForMoving,
        textAlign: TextAlign.start,
        maxLines: 1,
        style: context.textStyles.bodyLarge.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),

      verticalSpace(10.h),
      TimeDateColumnWidget(
        context,
        img: AppAssets.svgs.calendar_icon,
        imgText: context.date,
        bulText: 'الثلاثاء - 01/04',
      ),
      SizedBox(height: 15.h),
      TimeDateColumnWidget(
        context,
        img: AppAssets.svgs.clock_icon,
        imgText: context.time,
        bulText: '04 - 05 م',
      ),
    ],
  );
}
