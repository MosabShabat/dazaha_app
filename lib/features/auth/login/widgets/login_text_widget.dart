import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget LoginTextWidget(
  BuildContext context, {
  required title,
  required subTitle,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      verticalSpace(60.h),
      Text(title, style: context.textStyles.headlineSmall.bold),
      verticalSpace(15.h),
      Text(
        subTitle,
        style: context.textStyles.titleSmall.medium.copyWith(
          color: context.colorsCustom.TextSecondary,
          height: 2.h,
        ),
      ),
      verticalSpace(20.h),
    ],
  );
}
