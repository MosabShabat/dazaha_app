import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';

Widget DidSendCodeWidget(BuildContext context, {required controller}) {

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        context.iDidNotReceiveTheCode,
        style: context.textStyles.bodySmall.regular.copyWith(
          color: context.colorsCustom.TextSecondary,
        ),
      ),
      horizontalSpace(4.w),
      Obx(
        () => Text(
          controller.timerText.value,
          style: context.textStyles.bodySmall.regular.copyWith(
            color: context.colorsCustom.TextSecondary,
          ),
        ),
      ),
      SizedBox(width: 4),
      Obx(
        () => GestureDetector(
          onTap: () => controller.resendCode(),
          child: Text(
            context.resend,

            style: context.textStyles.titleSmall.medium.copyWith(
              color: controller.isResendEnabled.value
                  ? context.colorsCustom.BluePrimary
                  : context.colorsCustom.TextPrimary,
            ),
          ),
        ),
      ),
    ],
  );
}
