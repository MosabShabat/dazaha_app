import '../../../../core/constant/exports_libraries.dart';

Widget MyTextField({
  keyboardType,
  controller,
  obscureText,
  hintText,
  suffixIcon,
  maxLines,
  readOnly,
  prefixIcon,
  onSubmitted,
  Radius,
  initialValue,
  fillColor,
  hintStyleColor,
  enabledBorderColor,
  HintTextFontFamily,
  HintTextFontSize,
  maxLength,
  textAlign,
  textDirection,
  TextStyle? style,
  hintTextDirection,
  BorderSideColor,
  onTap,
  fontWeight,
  validator,
}) {
  return TextFormField(
    style: style,
    onFieldSubmitted: onSubmitted,
    initialValue: initialValue,
    textAlign: textAlign == null ? TextAlign.start : textAlign,
    readOnly: readOnly,
    onTap: onTap,
    maxLength: maxLength,
    validator: (value) {
      return validator(value);
    },
    keyboardType: keyboardType,
    controller: controller,
    maxLines: maxLines,
    obscureText: obscureText,
    textDirection: textDirection,
    decoration: InputDecoration(
      filled: true,
      fillColor: fillColor,
      hintText: hintText,
      hintStyle: TextStyle(
        // decorationStyle: TextDecorationStyle.dotted,
        fontFamily: HintTextFontFamily,
        color: hintStyleColor,
        fontWeight: fontWeight,
        decoration: hintTextDirection,
        fontSize: HintTextFontSize,
      ),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Radius),
        borderSide: BorderSide(width: 1, color: enabledBorderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Radius),
        borderSide: BorderSide(
          width: 1,
          color: BorderSideColor == null ? Colors.blue : BorderSideColor,
        ),
      ),
    ),
  );
}
