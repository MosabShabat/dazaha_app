import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../features/auth/register/controller/register_controller.dart';
import 'package:flutter/gestures.dart';

Widget CheckBoxListTailWidget(BuildContext context) {
  final RegisterController controller = Get.put(RegisterController());

  return Obx(
    () => Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: controller.isChecked.value,
          side: BorderSide(color: context.colorsCustom.CardBorder, width: 1),
          activeColor: context.colorsCustom.TealGreenSecondary,
          checkColor: context.colorsCustom.surfacePrimaryWhite,
          onChanged: (_) => controller.setChecked(!controller.isChecked.value),
        ),
        Expanded(
          child: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              style: context.textStyles.bodySmall.medium.copyWith(
                color: context.colorsCustom.TextSecondary,
                fontFamily: 'Tajawal',
              ),
              children: [
                TextSpan(text: context.iAgreeTo + ' '),
                TextSpan(
                  text: context.termsAndConditions,
                  style: context.textStyles.bodySmall.medium.copyWith(
                    color: context.colorsCustom.BluePrimary,
                    decoration: TextDecoration.underline,
                    decorationThickness: 1.0,
                    decorationColor: context.colorsCustom.BluePrimary,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.toNamed(
                        Routes.termsAndConditionsScreen,
                        arguments: {
                          AppConstants.infoType: AppConstants.termsConditions,
                        },
                      );
                    },
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
