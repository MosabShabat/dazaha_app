import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';

Widget TotDetRowWidget(
  BuildContext context, {
  required String text1,
  required String text2,
  String? familyText1,
  String? familyText2,
  double? sizeText1,
  double? sizeText2,
  Color? textColor1,
  Color? textColor2,
  FontWeight? fontWeight1,
  FontWeight? fontWeight2,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text1,
        style: context.textStyles.titleSmall.regular.copyWith(
          color: textColor1 ?? context.colorsCustom.TextPrimary,
          fontFamily:
              familyText1 ?? context.textStyles.bodyMedium.regular.fontFamily,
          fontSize: sizeText1 ?? 14.sp,
          fontWeight: fontWeight1,
        ),
      ),
      Text(
        text2,
        style: context.textStyles.bodyMedium.medium.copyWith(
          color: textColor2 ?? context.colorsCustom.TextPrimary,
          fontFamily:
              familyText2 ?? context.textStyles.bodyMedium.medium.fontFamily,
          fontSize: sizeText2 ?? 14.sp,
          fontWeight: fontWeight2,
        ),
      ),
    ],
  ).box.width(393.w).make();
}
