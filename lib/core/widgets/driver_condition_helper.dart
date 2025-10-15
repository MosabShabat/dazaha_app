import '../../features/choose_the_service/controller/order_data_controller.dart';
import '../constant/exports_libraries.dart';
import '../constant/exports_widgets.dart';

class DriverConditionHelper {
  static void handleDriverCondition({
    required BuildContext context,
    required OrderDataController orderDataController,
    required VoidCallback onDriverActive,
  }) {
    if (orderDataController.isNotDriver) {
      Get.dialog(
        _buildDialog(context, context.youMustDriver),
        barrierDismissible: false,
      ).then((_) => Get.back()); // يرجع للشاشة السابقة
    } else if (orderDataController.isDriverUnderReview) {
      Get.dialog(
        _buildDialog(context, context.theDriverApplicationIsUnder),
        barrierDismissible: false,
      ).then((_) => Get.back());
    } else if (orderDataController.isDriver) {
      onDriverActive(); // هنا فقط اللي بيتغير
    }
  }

  /// ✅ Dialog موحد مع زر رجوع
  static Widget _buildDialog(BuildContext context, String text) {
    return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: context.textStyles.titleLarge.bold.copyWith(
                color: context.colorsCustom.TextPrimary,
                decoration: TextDecoration.none,
              ),
            ),
            verticalSpace(20.h),
            ElevatedButton(
              onPressed: () => Get.back(), // يغلق Dialog ويعود
              child: Text(context.continuation),
            ),
          ],
        ).box
        .width(300.w)
        .padding(EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h))
        .customRounded(BorderRadius.circular(12.r))
        .color(context.colorsCustom.surfacePrimaryWhite)
        .makeCentered();
  }
}
