import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget DateTimeDelWidget(
  BuildContext context, {
  required icon,
  required title,
  required subTitle,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SvgPicture.asset(icon),
      horizontalSpace(5.w),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.start,
            style: context.textStyles.bodySmall.medium.copyWith(
              color: context.colorsCustom.TextSecondary,
            ),
          ),
          verticalSpace(5.h),
          Text(
            subTitle,
            textAlign: TextAlign.start,
            style: context.textStyles.bodySmall.medium.copyWith(
              color: context.colorsCustom.TextPrimary,
            ),
          ),
        ],
      ),
    ],
  );
}
