import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';

extension DialogExtensions on BuildContext {
  void showDeleteDialog({
    required String title,
    required String message,
    required VoidCallback onConfirm,
  }) {
    Get.defaultDialog(
      title: title,
      titleStyle: textStyles.bodyLarge.bold.copyWith(
        color: colorsCustom.TextPrimary,
      ),
      middleText: message,
      middleTextStyle: textStyles.bodyMedium.copyWith(
        color: colorsCustom.TextSecondary,
      ),
      radius: 12.r,
      confirm: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorsCustom.TealGreenSecondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        onPressed: () {
          onConfirm();
          Get.back();
        },
        child: Text(
          this.yes,
          style: TextStyle(color: Colors.white),
        ),
      ),
      cancel: TextButton(
        onPressed: () => Get.back(),
        child: Text(
          this.no,
          style: TextStyle(
            color: colorsCustom.TextSecondary,
          ),
        ),
      ),
    );
  }
}
