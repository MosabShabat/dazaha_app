import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/helpers/theme_exports.dart';

Widget CusRegisterInfoWidget(
  BuildContext context, {
  required titleText,
  required titleTextColor,
  required HintText,
  required maxLines,
  required maxLength,
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
      verticalSpace(8.h),
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
        hintStyleColor: context.colorsCustom.TextSecondary,
        HintTextFontFamily: context.textStyles.bodySmall.regular,
        HintTextFontSize: 12.0.sp,
        fillColor: context.colorsCustom.surfacePrimaryWhite,
      ),
      verticalSpace(20.h),
    ],
  );
}
