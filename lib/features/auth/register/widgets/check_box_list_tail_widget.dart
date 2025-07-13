import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/auth/register/controller/register_controller.dart';
import 'package:flutter/gestures.dart';

Widget CheckBoxListTailWidget(BuildContext context) {
  final RegisterController controller = Get.put(RegisterController());
  //RegisterController
  return Obx(() {
    final _switchValue = controller.switchValue.value;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          side: BorderSide(color: context.colorsCustom.CardBorder, width: 1),
          value: _switchValue,
          activeColor: context.colorsCustom.TealGreenSecondary,
          onChanged: (value) {
            controller.toggleSwitch();
          },
        ),
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: context.iAgreeTo,
                style: context.textStyles.bodySmall.medium.copyWith(
                  color: context.colorsCustom.TextSecondary,
                ),
              ),
              TextSpan(
                text: ' ${context.termsAndConditions}',

                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.toNamed(Routes.termsAndConditionsScreen);
                  },
                style: context.textStyles.bodySmall.medium.copyWith(
                  color: context.colorsCustom.BluePrimary,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  });
}
