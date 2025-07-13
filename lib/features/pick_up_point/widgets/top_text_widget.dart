import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/helpers/spacing.dart';
import 'package:dazaha_app/core/helpers/theme_exports.dart';

Widget TopTextWidget(
  BuildContext context, {
  required Title,
  required SubTitle,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '${Title}',
        textAlign: TextAlign.center,
        maxLines: 1,
        style: context.textStyles.titleLarge.bold.copyWith(
          color: context.colorsCustom.TextPrimary,
          fontSize: 20.sp,
        ),
      ),
      verticalSpace(10.h),
      Text(
        '${SubTitle}',
        textAlign: TextAlign.center,
        maxLines: 1,
        style: context.textStyles.titleSmall.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),
    ],
  );
}
