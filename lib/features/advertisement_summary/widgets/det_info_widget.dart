import '../../../core/constant/exports_libraries.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/helpers/theme_exports.dart';

Widget DetInfoWidget(
  BuildContext context, {
  required String textTitle,
  required String TextSubTitle,
}) {
  final titleStyle = context.textStyles.titleSmall.regular.copyWith(
    color: context.colorsCustom.TextSecondary,
  );
  final subTitleStyle = context.textStyles.bodySmall.bold.copyWith(
    color: context.colorsCustom.TextPrimary,
  );

  return Padding(
    padding: EdgeInsets.only(top: 20.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(textTitle, style: titleStyle, maxLines: 5),
        verticalSpace(10.h),
        Text(TextSubTitle, style: subTitleStyle, maxLines: 5),
      ],
    ),
  );
}
