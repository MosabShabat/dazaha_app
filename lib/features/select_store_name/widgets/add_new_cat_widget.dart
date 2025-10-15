import '../../../core/constant/exports_widgets.dart';
import '../../../core/constant/exports_libraries.dart';
import '../controller/select_store_name_controller.dart';

Widget AddNewCatWidget(BuildContext context) {
  final controller = Get.find<SelectStoreNameController>();

  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
            child: Icon(
              Icons.add,
              size: 25.w,
              color: context.colorsCustom.surfacePrimaryWhite,
            ),
          ).box
          .customRounded(BorderRadius.all(Radius.circular(5.r)))
          .color(context.colorsCustom.BluePrimary)
          .make(),
      horizontalSpace(5.w),
      Text(
        context.addANewCategory,
        textAlign: TextAlign.center,
        maxLines: 1,
        style: context.textStyles.titleMedium.medium.copyWith(
          color: context.colorsCustom.BluePrimary,
        ),
      ),
    ],
  ).onTap(() {
    controller
        .addNewItem(); // دالة في الكونترولر تزيد numOfList وتضيف Counter وTextController جديد
  });
}
