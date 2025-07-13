import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:flutter/gestures.dart';

Widget DidSendCodeWidget(BuildContext context) {
  return RichText(
    text: TextSpan(
      children: <TextSpan>[
        TextSpan(
          text: context.iDidNotReceiveTheCode,
          style: context.textStyles.bodySmall.regular.copyWith(
            color: context.colorsCustom.TextSecondary,
          ),
        ),
        TextSpan(
          text: ' ${context.resend}',
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              // Get.toNamed(Routes.termsAndConditionsScreen);
            },
          style: context.textStyles.titleSmall.medium.copyWith(
            color: context.colorsCustom.BluePrimary,
          ),
        ),
      ],
    ),
  ).box.alignCenter.make();
}
