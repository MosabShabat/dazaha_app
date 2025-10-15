// ignore_for_file: must_be_immutable

import '../../../core/helpers/app_shared_methods.dart';
import 'package:flutter/material.dart';
import '../theming/app_text_styles.dart';

class AppLoadingButton extends StatelessWidget {
  final String text;
  final Future<void> Function() onPressed;
  bool isLoading;
  final bool isWhiteProgress;
  final Color buttonColor;
  final double width;
  final double height;
  final TextStyle? textStyle;
  final bool isEnabled;

  AppLoadingButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.isLoading,
    this.isWhiteProgress = false,
    this.buttonColor = const Color(0xFF119892),
    this.width = double.infinity,
    this.height = 52,
    this.textStyle,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled
          ? () async {
              isLoading = true;
              await onPressed();
              isLoading = false;
            }
          : null,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        backgroundColor: isEnabled
            ? buttonColor
            : Color(0xFF119892).withOpacity(0.2),
        disabledBackgroundColor: Color(0xFFFFFFFFF),
        elevation: 0,
      ),
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        child: isLoading
            ? AppSharedMethods.buildProgressViewWhite(context, isWhiteProgress)
            : Text(
                text,
                style: isEnabled
                    ? textStyle ?? AppTextStyles.font16White500Medium(context)
                    : AppTextStyles.font16Black500Medium(context),
              ),
      ),
    );
  }
}
