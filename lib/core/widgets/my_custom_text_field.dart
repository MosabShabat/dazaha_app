import '../../../../core/constant/exports_libraries.dart';

Widget MyTextField({
  TextEditingController? controller,
  String? initialValue,
  bool obscureText = false,
  String? hintText,
  Widget? suffixIcon,
  int? maxLines,
  bool readOnly = false,
  Widget? prefixIcon,
  Function(String)? onSubmitted,
  double? Radius,
  Color? fillColor,
  Color? hintStyleColor,
  Color? enabledBorderColor,
  String? HintTextFontFamily,
  double? HintTextFontSize,
  int? maxLength,
  TextAlign? textAlign,
  TextDirection? textDirection,
  TextStyle? style,
  Color? BorderSideColor,
  VoidCallback? onTap,
  FontWeight? fontWeight,
  String? Function(String?)? validator,
  keyboardType,
  onChanged,
  counterText,
}) {
  // ✅ لو فيه initialValue و controller فاضي
  if (initialValue != null && controller != null && controller.text.isEmpty) {
    controller.text = initialValue;
  }

  return TextFormField(
    controller: controller,
    obscureText: obscureText,
    readOnly: readOnly,
    onTap: onTap,
    validator: validator,
    onChanged: onChanged,
    onFieldSubmitted: onSubmitted,
    keyboardType:
        keyboardType ??
        (maxLines != null && maxLines > 1
            ? TextInputType.multiline
            : TextInputType.name),
    maxLines: maxLines,
    maxLength: maxLength,
    textAlign: textAlign ?? TextAlign.start,
    textDirection: textDirection,
    style: style,
    decoration: InputDecoration(
      filled: true,
      fillColor: fillColor,
      counterText: counterText,
      hintText: hintText,
      hintStyle: TextStyle(
        fontFamily: HintTextFontFamily,
        color: hintStyleColor,
        fontWeight: fontWeight,
        fontSize: HintTextFontSize,
      ),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Radius ?? 8),
        borderSide: BorderSide(
          width: 1,
          color: enabledBorderColor ?? Colors.grey,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Radius ?? 8),
        borderSide: BorderSide(width: 1, color: BorderSideColor ?? Colors.blue),
      ),
    ),
  );
}
