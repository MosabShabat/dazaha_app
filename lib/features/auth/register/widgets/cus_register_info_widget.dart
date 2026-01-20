
import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';

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
  controller,
  readOnly,
  keyboardType,
  initialValue,
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
      verticalSpace(10.h), // قلل المسافة شوي لتكون أنسب
      MyTextField(
        context,
        Radius: 10.0,
        textAlign: TextAlign.start,
        readOnly: readOnly ?? false,
        maxLines: maxLines ?? 1,
        maxLength: maxLength,
        showDoneButton: true, // ⭐ هنا
        obscureText: false,
        initialValue: initialValue,
        enabledBorderColor: context.colorsCustom.CardBorder,
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.name,
        textInputAction: TextInputAction.done, // ✅ زر Done
        onSubmitted: (_) {
          FocusScope.of(
            context,
          ).unfocus(); // ✅ لإخفاء الكيبورد عند الضغط على Done
        },
        hintText: HintText,
        hintStyleColor: HintTextColor ?? context.colorsCustom.TextSecondary,
        HintTextFontFamily:
            HintTextFontFamily ??
            context.textStyles.bodySmall.regular.fontFamily,
        HintTextFontSize: 12.0.sp,
        fillColor: context.colorsCustom.surfacePrimaryWhite,
        fontWeight: fontWeight,
      ),
      verticalSpace(15.h),
    ],
  );
}
