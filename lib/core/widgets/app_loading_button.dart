// ignore_for_file: must_be_immutable

import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/helpers/app_shared_methods.dart';
import '../theming/app_text_styles.dart';

class AppLoadingButton extends StatelessWidget {
  final String text;
  final Future<void> Function() onPressed;
  bool isLoading;
  final bool isWhiteProgress;
  final double width;
  final double height;
  final TextStyle? textStyle;
  final bool isEnabled;
  final buttonColor;

  AppLoadingButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.isLoading,
    this.buttonColor,
    this.isWhiteProgress = false,
    this.width = double.infinity,
    this.height = 52,
    this.textStyle,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ElevatedButton(
        onPressed: isEnabled
            ? () async {
                isLoading = true;
                await onPressed();
                isLoading = false;
              }
            : null,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          backgroundColor:
              buttonColor ?? context.colorsCustom.TealGreenSecondary,
          disabledBackgroundColor: isEnabled
              ? context.colorsCustom.surfacePrimaryWhite
              : buttonColor ?? context.colorsCustom.TealGreenSecondary,
          elevation: 0,
        ),
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          child: isLoading
              ? AppSharedMethods.buildProgressViewWhite(
                  context,
                  isWhiteProgress,
                ).box.size(18.w, 18.w).make()
              : Text(
                  text,
                  style: isEnabled
                      ? textStyle ?? AppTextStyles.font16White500Medium(context)
                      : AppTextStyles.font16Black500Medium(context),
                ),
        ),
      ),
    );
  }
}
