import '../../../../core/constant/exports_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theming/app_text_styles.dart';

class AppTextButton extends StatelessWidget {
  final BuildContext context;
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final String? suffixText;
  final TextStyle? textStyle;
  final TextStyle? suffixTextStyle;
  final VoidCallback onPressed;
  final String? svgIconPath;
  final String? svgIconPathEnd;
  final Color? svgColor;
  final double? svgWidth;
  final double? svgHight;

  final bool enableHover;
  final bool hasBorder;
  final Color? borderColor;
  final MainAxisAlignment? mainAxisAlignment;

  // New properties for active state
  final bool isActive;
  final String? activeSvgIconPathEnd;
  final Color? activeBorderColor;
  final Color? activeSvgColor;
  final Color? inactiveSvgColor;

  const AppTextButton(
    this.context, {
    Key? key,
    this.borderRadius,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonHeight,
    this.buttonWidth,
    required this.buttonText,
    this.suffixText,
    this.textStyle,
    this.suffixTextStyle,
    required this.onPressed,
    this.svgIconPath,
    this.svgIconPathEnd,
    this.svgColor,
    this.svgWidth,
    this.svgHight,
    this.enableHover = true,
    this.hasBorder = false,
    this.borderColor,
    this.mainAxisAlignment,
    this.isActive = false,
    this.activeSvgIconPathEnd,
    this.activeBorderColor,
    this.activeSvgColor,
    this.inactiveSvgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: _buildButtonStyle(),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        children: _buildButtonContent(),
      ),
    );
  }

  ButtonStyle _buildButtonStyle() {
    return ButtonStyle(
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
          side: hasBorder
              ? BorderSide(
                  color: isActive
                      ? activeBorderColor ?? context.colorsCustom.TealGreenSecondary
                      : borderColor ?? context.colorsCustom.CardBorder,
                  width: 1.0,
                )
              : BorderSide.none,
        ),
      ),
      backgroundColor: WidgetStateProperty.all(
        backgroundColor ?? context.colorsCustom.TealGreenSecondary ,
      ),
      padding: WidgetStateProperty.all<EdgeInsets>(
        EdgeInsets.symmetric(
          horizontal: horizontalPadding?.w ?? 12.w,
          vertical: verticalPadding?.h ?? 14.h,
        ),
      ),
      fixedSize: WidgetStateProperty.all(
        Size(buttonWidth?.w ?? double.maxFinite, buttonHeight ?? 52.h),
      ),
      overlayColor: enableHover
          ? WidgetStateProperty.resolveWith<Color?>(
              (states) {
                if (states.contains(WidgetState.hovered)) {
                  return context.colorsCustom.TealGreenSecondary.withOpacity(0.8);
                }
                return null;
              },
            )
          : WidgetStateProperty.all<Color?>(Colors.transparent),
    );
  }

  List<Widget> _buildButtonContent() {
    List<Widget> content = [];
    if (svgIconPath != null) {
      content.add(SvgPicture.asset(
        svgIconPath!,
        width: svgWidth?.w ?? 20.w,
        height: svgHight?.h ?? 20.h,
        colorFilter: svgColor != null
            ? ColorFilter.mode(svgColor!, BlendMode.srcIn)
            : null,
      ));
      content.add(SizedBox(width: 4.w));
    }

    Widget textWidget = Text(
      buttonText,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: textStyle ?? AppTextStyles.font16White500Medium(context),
    );

    if (svgIconPathEnd != null) {
      content.add(Expanded(child: textWidget));
      content.add(SvgPicture.asset(
        isActive ? activeSvgIconPathEnd ?? svgIconPathEnd! : svgIconPathEnd!,
        // width: svgWidth?.w ?? 16.w,
        // height: svgHight?.h ?? 16.h,
        colorFilter: ColorFilter.mode(
          isActive
              ? activeSvgColor ?? context.colorsCustom.TealGreenSecondary
              : inactiveSvgColor ?? context.colorsCustom.surfacePrimaryBlack,
          BlendMode.srcIn,
        ),
      ));
    } else {
      content.add(textWidget);
    }

    if (suffixText != null) {
      content.add(horizontalSpace(4));
      content.add(Text(
        suffixText!,
        style: suffixTextStyle ??  TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w300,
      color: context.colorsCustom.TextSecondary,
      fontFamily: 'Tajawal'),
      ));
      content.add(horizontalSpace(12));
    }

    return content;
  }
}
