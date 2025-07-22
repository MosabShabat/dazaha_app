import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/price_cat_details/widgets/date_time_del_widget.dart';

Widget TDDelWidget(BuildContext context,{required title,Fz}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
      title,
        textAlign: TextAlign.start,
        style: context.textStyles.bodyMedium.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
          fontSize: Fz
        ),
      ),
      verticalSpace(10.h),
      DateTimeDelWidget(
        context,
        icon: AppAssets.svgs.calendar_icon,
        title: context.date,
        subTitle: 'الثلاثاء - 08/05/2025',
      ),
      verticalSpace(10.h),
      DateTimeDelWidget(
        context,
        icon: AppAssets.svgs.clock_icon,
        title: context.time,
        subTitle: '04 - 05 م',
      ),
    ],
  );
}
