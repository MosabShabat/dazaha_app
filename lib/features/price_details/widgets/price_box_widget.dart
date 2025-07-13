import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget PriceBoxWidget(BuildContext context) {
  return Container(
        child: Text(
          'د.ع 12,000 ',
          textAlign: TextAlign.center,
          maxLines: 1,
          style: context.textStyles.headlineSmall.medium.copyWith(
            color: context.colorsCustom.BluePrimary,
          ),
        ),
      ).box
      .customRounded(BorderRadiusGeometry.all(Radius.circular(8).w))
      .width(Width)
      .padding(EdgeInsetsGeometry.symmetric(vertical: 30.h))
      // .height(100.h)
      .color(context.colorsCustom.BluePrimary.withOpacity(0.1))
      .make();
}
