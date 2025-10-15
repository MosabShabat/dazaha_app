import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import 'date_time_del_widget.dart';

Widget TDDelWidget(
  BuildContext context, {
  required title,
  Fz,
  required date,
  required time,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        textAlign: TextAlign.start,
        style: context.textStyles.bodyMedium.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
          fontSize: Fz,
        ),
      ),
      verticalSpace(10.h),
      DateTimeDelWidget(
        context,
        icon: AppAssets.svgs.calendar_icon,
        title: context.date,
        subTitle: date,
      ),
      verticalSpace(10.h),
      DateTimeDelWidget(
        context,
        icon: AppAssets.svgs.clock_icon,
        title: context.time,
        subTitle: time,
      ),
    ],
  );
}
