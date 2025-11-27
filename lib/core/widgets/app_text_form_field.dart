import '../../../../core/constant/exports_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final textAlign;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final TextInputType keyboardType;
  final bool hasBorder;
  final BorderRadiusGeometry borderRadius;
  final int? maxLength;
  final bool showMaxLength;
  final TextDirection? textDirection;
  final String? prefixSvgIcon;
  final String? suffixText;
  final TextStyle? suffixTextStyle;
  final double? height;
  final TextInputAction? textInputAction;
  final bool? enabled;
  final Function(String)? onChanged;
  final bool? hintCenter;
  final Function(String)? onFieldSubmitted;
  final VoidCallback? onTap;
  final bool readOnly;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    required this.textAlign,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    required this.keyboardType,
    this.hasBorder = true,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.maxLength,
    this.showMaxLength = false,
    this.textDirection,
    this.prefixSvgIcon,
    this.suffixText,
    this.suffixTextStyle,
    this.height,
    this.textInputAction,
    this.enabled = true,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTap,
    this.hintCenter = false,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    final borderSide = hasBorder
        ? BorderSide(color: context.colorsCustom.CardBorder, width: 1.0)
        : BorderSide.none;

    final border = OutlineInputBorder(
      borderSide: borderSide,
      borderRadius: borderRadius as BorderRadius,
    );

    return TextFormField(
      cursorColor: context.colorsCustom.TextPrimary,
      selectionControls: materialTextSelectionControls,
      controller: controller,
      enabled: enabled,

      readOnly: readOnly,
      decoration: InputDecoration(
        isDense: true,

        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.h, vertical: 14.w),
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        errorBorder: border,
        focusedErrorBorder: border,
        hintStyle:
            hintStyle ??
            TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: context.colorsCustom.TextPrimary,
              fontFamily: 'sans',
            ),
        hintText: hintText,
        suffixIcon: suffixIcon,
        suffixText: suffixText,
        suffixStyle:
            suffixTextStyle ??
            TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: context.colorsCustom.TextPrimary,
              fontFamily: 'sans',
            ),
        prefixIcon: prefixSvgIcon != null
            ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(prefixSvgIcon!),
              )
            : null,
        fillColor: backgroundColor ?? context.colorsCustom.surfacePrimaryWhite,
        filled: true,
        counterText: showMaxLength ? null : '',
      ),
      obscureText: isObscureText ?? false,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: context.colorsCustom.TextPrimary,
        fontFamily: 'sans',
      ),
      keyboardType: keyboardType,
      maxLength: maxLength,
      validator: (value) {
        return validator(value);
      },
      textAlign: textAlign == 'null'
          ? hintCenter == true
                ? TextAlign.center
                : TextAlign.start
          : textAlign,
      // textAlign: hintCenter == true ? TextAlign.center : TextAlign.start,
      textDirection: textDirection,
      minLines: (height != null) ? (height! ~/ 24).toInt() : 1,
      maxLines: (height != null) ? (height! ~/ 24).toInt() : null,
      textInputAction: textInputAction ?? TextInputAction.done,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
    );
  }
}
