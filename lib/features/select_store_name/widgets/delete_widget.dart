import '../../../core/constant/exports_widgets.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/widgets/list_tale_circle_avatar_widget.dart';
import '../controller/select_store_name_controller.dart';

Widget DeleteWidget(BuildContext context, int index) {
  final controller = Get.find<SelectStoreNameController>();

  return Positioned(
    left: Localizations.localeOf(context).languageCode == "ar" ? -3.0.w : null,
    right: Localizations.localeOf(context).languageCode != "ar" ? -3.0.w : null,
    child: GestureDetector(
      onTap: () {
        controller.confirmDelete(index);
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
