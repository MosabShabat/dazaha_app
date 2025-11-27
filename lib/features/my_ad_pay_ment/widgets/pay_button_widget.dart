import '../../../core/constant/exports_libraries.dart';
// import '../../../core/constant/exports_widgets.dart';
import '../../../core/widgets/app_loading_button.dart';
import '../controller/my_ad_pay_ment_controller.dart';

Widget PayButtonWidget(
  BuildContext context, {
  required MyAdPayMentController controller,
}) {
  return Obx(() {
    final model = controller.orderPaymentModel;
    if (model == null) return const SizedBox.shrink();

    // final totalText = "${context.payNow}  ${model.total} ${model.currency}";

    return AppLoadingButton(
      text: controller.totalText.value,
      onPressed: () async {
        if (model.paymentWays.isNotEmpty) {
          final selectedPay = model.paymentWays[controller.selectedIndex.value];
          controller.executeOrder(
            context,
            paymentWayUuid: selectedPay.uuid,
            couponCode: controller.couponCodeController.text,
          );
        }
      },
      isLoading: controller.isButtonPressed.value,
      isEnabled: !controller.isButtonPressed.value,

      isWhiteProgress: true,
    );
  });
}
