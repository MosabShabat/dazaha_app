import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/helpers/spacing.dart';
import 'package:dazaha_app/core/helpers/theme_exports.dart';

Widget DetInfoWidget(
  BuildContext context, {
  required textTitle,
  required TextSubTitle,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      verticalSpace(20.h),
      Text(
        '${textTitle}',
        textAlign: TextAlign.start,
        maxLines: 5,
        style: context.textStyles.titleSmall.regular.copyWith(
          color: context.colorsCustom.TextSecondary,
        ),
      ),

      verticalSpace(10.h),
      Text(
        '${TextSubTitle}',
        textAlign: TextAlign.start,
        maxLines: 5,
        style: context.textStyles.bodySmall.bold.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),
    ],
  );
}
