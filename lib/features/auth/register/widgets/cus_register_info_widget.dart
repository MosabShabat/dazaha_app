import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget CusRegisterInfoWidget(
  BuildContext context, {
  required titleText,
  required titleTextColor,
  required HintText,
  HintTextColor,
  HintTextFontFamily,
  required maxLines,
  required maxLength,
  fontWeight,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '${titleText}',
        style: context.textStyles.bodyMedium.medium.copyWith(
          color: titleTextColor,
        ),
      ),
      verticalSpace(15.h),
      MyTextField(
        Radius: 10.0,
        textAlign: TextAlign.start,
        readOnly: false,
        maxLines: maxLines == null ? 1 : maxLines,
        maxLength: maxLength,
        obscureText: false,
        enabledBorderColor: context.colorsCustom.CardBorder,
        // controller: _LastNameTextController,
        keyboardType: TextInputType.name,
        hintText: HintText,
        hintStyleColor: HintTextColor ?? context.colorsCustom.TextSecondary,
        HintTextFontFamily:
            HintTextFontFamily ??
            context.textStyles.bodySmall.regular.fontFamily,
        HintTextFontSize: 12.0.sp,
        fillColor: context.colorsCustom.surfacePrimaryWhite,
        fontWeight: fontWeight,
      ),
      verticalSpace(20.h),
    ],
  );
}
