import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget AddNewCatWidget(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
            child: Icon(
              Icons.add,
              //summary
              size: 25.w,
              color: context.colorsCustom.surfacePrimaryWhite,
            ),
          ).box
          .customRounded(BorderRadiusGeometry.all(Radius.circular(5.r)))
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
  );
}
