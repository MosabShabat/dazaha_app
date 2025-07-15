import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget AboutTheAppDetWidget(
  BuildContext context, {
  required title,
  required subTitle,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: context.textStyles.labelLarge.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),
      verticalSpace(10.h),
      Text(
        subTitle,
        maxLines: 20,
        style: context.textStyles.bodySmall.regular.copyWith(
          color: context.colorsCustom.TextSecondary,
          height: 1.5.h,
        ),
      ),
      verticalSpace(20.h),
    ],
  );
}
