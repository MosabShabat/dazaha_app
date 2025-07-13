import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget SleColTextWidget(
  BuildContext context, {
  required title,
  required subTitle,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text(
        title,
        style: context.textStyles.titleSmall.regular.copyWith(
          color: context.colorsCustom.ButtonLabelPrimary,
        ),
      ),
      verticalSpace(5.h),
      Text(
        subTitle,
        style: context.textStyles.titleMedium.bold.copyWith(
          color: context.colorsCustom.ButtonLabelPrimary,
        ),
      ),
    ],
  );
}