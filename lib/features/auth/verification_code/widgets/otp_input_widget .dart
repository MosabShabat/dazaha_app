import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

Widget OtpInputWidget(BuildContext context, bool resatAll,{required controller}) {

  return Directionality(
    textDirection: TextDirection.ltr,
    child: Padding(
      padding: const EdgeInsets.only(right: 24, left: 24),
      child: PinCodeTextField(
        focusNode: controller.otpFocusNode,
        length: 4,
        onChanged: (value) {
          controller.updateOtpCode(value);
        },
        onCompleted: (value) {
          controller.updateOtpCode(value);
          controller.validateAndProceed(context, resatAll);
        },
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(8),
          fieldHeight: 56,
          fieldWidth: 56,
          activeColor: context.colorsCustom.TealGreenSecondary,
          inactiveColor: context.colorsCustom.CardBackgroundLightGray,
          selectedColor: context.colorsCustom.TealGreenSecondary,
          selectedFillColor: context.colorsCustom.TealGreenSecondary,
          inactiveFillColor: context.colorsCustom.surfacePrimaryWhite,
          borderWidth: 1,
          fieldOuterPadding: EdgeInsets.symmetric(horizontal: 12),
        ),
        keyboardType: TextInputType.number,
        appContext: context,
        animationType: AnimationType.fade,
        textStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: context.colorsCustom.TextPrimary,
          fontFamily: 'Tajawal',
        ),
      ),
    ),
  );
}
