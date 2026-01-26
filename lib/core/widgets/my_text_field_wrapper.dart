// ملف جديد مثلاً: my_text_field_wrapper.dart

import 'dart:io';

import '../../../core/widgets/my_custom_text_field.dart';

import '../../../../core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

Widget MyTextField(
  BuildContext context, {
  TextInputType? keyboardType,
  TextEditingController? controller,
  bool obscureText = false,
  String? hintText,
  Widget? suffixIcon,
  int? maxLines,
  bool readOnly = false,
  Widget? prefixIcon,
  Function(String)? onSubmitted,
  double Radius = 12.0,
  String?
  initialValue, // ملاحظة: TextFormField لا يدعم initialValue مع controller
  Color? fillColor,
  Color? hintStyleColor,
  Color? enabledBorderColor,
  String? HintTextFontFamily,
  double? HintTextFontSize,
  int? maxLength,
  TextAlign? textAlign,
  TextDirection? textDirection,
  TextDecoration? hintTextDirection,
  Color? BorderSideColor,
  VoidCallback? onTap,
  FontWeight? fontWeight,
  String? Function(String?)? validator,
  required KeyboardDoneController keyboardDoneController,
}) {
  final doneController = keyboardDoneController;
  final VoidCallback? userOnTap = onTap;
  final Function(String)? userOnSubmitted = onSubmitted;
  return AppTextFormField(
    hintText: hintText ?? '',
    textAlign: 'null',
    keyboardType: keyboardType ?? TextInputType.text,
    controller: controller,
    isObscureText: obscureText,
    suffixIcon: suffixIcon,
    backgroundColor: fillColor,
    borderRadius: BorderRadius.circular(Radius),
    maxLength: maxLength,
    textDirection: textDirection,
    onTap: () {
      if (Platform.isIOS) {
        doneController.show(context);
      }
      userOnTap?.call(); // يحافظ على منطقك السابق
    },

    onFieldSubmitted: (value) {
      doneController.hide();
      userOnSubmitted?.call(value); // ⭐ منطقك
      FocusManager.instance.primaryFocus?.unfocus();
    },
    validator: validator ?? (_) => null,
    hintStyle: TextStyle(
      color: hintStyleColor,
      fontWeight: fontWeight,
      fontSize: HintTextFontSize,
      fontFamily: HintTextFontFamily,
      decoration: hintTextDirection,
    ),
    inputTextStyle: TextStyle(fontWeight: fontWeight),
    hasBorder: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    textInputAction: TextInputAction.done,
    hintCenter: textAlign == TextAlign.center,
  );
}
