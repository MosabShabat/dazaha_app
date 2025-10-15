import '../../../core/constant/exports_widgets.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/widgets/list_tale_circle_avatar_widget.dart';
import '../controller/select_store_name_controller.dart';
import 'snack_bar_widget.dart';

Widget DeleteWidget(BuildContext context, int index) {
  final controller = Get.find<SelectStoreNameController>();

  return Positioned(
    left: Localizations.localeOf(context).languageCode == "ar" ? -3.0.w : null,
    right: Localizations.localeOf(context).languageCode != "ar" ? -3.0.w : null,
    child: GestureDetector(
      onTap: () {
        controller.scheduleDelete(index); // حفظ العنصر مؤقتًا

        // فتح الـ BottomSheet
        Get.bottomSheet(
          deleteConfirmationBottomSheet(
            context,
            title: context.deletedSuccessfully,
            buttonText: context.toRetreat,
            isShow: true,
            isShowRow: true,
            onTap: () {
              controller.undoDelete(); // استرجاع العنصر
              if (Get.isBottomSheetOpen ?? false)
                Get.back(); // إغلاق الـ BottomSheet
            },
          ),
          isDismissible: false,
          backgroundColor: Colors.transparent,
        );

        // حذف العنصر بعد 3 ثواني إذا لم يتم الضغط على "تراجع"
        Future.delayed(const Duration(seconds: 3), () {
          if (Get.isBottomSheetOpen ?? false) {
            controller.confirmDelete();
            Get.back(); // إغلاق الـ BottomSheet بعد الحذف
          }
        });
      },
      child: CircleAvatar(
        backgroundColor: context.colorsCustom.surfacePrimaryWhite,
        radius: 15.w,
        child: IconCircleAvatarWidget(
          backGroundColor: context.colorsCustom.redColor,
          sizeCircleAvatar: 12.w,
          icon: Icons.remove,
          sizIcon: 25.w,
          colorIcon: context.colorsCustom.surfacePrimaryWhite,
        ),
      ),
    ),
  );
}
