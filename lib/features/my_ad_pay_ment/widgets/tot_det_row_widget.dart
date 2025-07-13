import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget TotDetRowWidget(
  BuildContext context, {
  required text1,
  required text2,
  familyText1,
  sizeText2,
  sizeText1,
  familyText2,
  textColor1,
  textColor2,
  fontWeight1,
  fontWeight2,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text1,
        style: context.textStyles.titleSmall.regular.copyWith(
          color: textColor1 == null
              ? context.colorsCustom.TextPrimary
              : textColor1,
          fontFamily: familyText1 == null
              ? context.textStyles.bodyMedium.regular.fontFamily
              : familyText1,
          fontSize: sizeText1 == null ? 14.sp : sizeText1,
          fontWeight: fontWeight1,
        ),
      ),
      Text(
        text2,
        style: context.textStyles.bodyMedium.medium.copyWith(
          color: textColor2 == null
              ? context.colorsCustom.TextPrimary
              : textColor2,
          fontFamily: familyText2 == null
              ? context.textStyles.bodyMedium.medium.fontFamily
              : familyText2,
          fontSize: sizeText2 == null ? 14.sp : sizeText2,
          fontWeight: fontWeight2,
        ),
      ),
    ],
  ).box.width(393.w).make();
}
