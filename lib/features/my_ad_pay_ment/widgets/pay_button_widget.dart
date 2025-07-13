import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget PayButtonWidget(BuildContext context) {
  return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.payNow,
            style: context.textStyles.titleMedium.medium.copyWith(
              color: context.colorsCustom.ButtonLabelPrimary,
            ),
          ),
          Text(
            '11,222 د.ع',
            style: context.textStyles.titleMedium.medium.copyWith(
              color: context.colorsCustom.ButtonLabelPrimary,
            ),
          ),
        ],
      ).box
      .customRounded(BorderRadiusGeometry.circular(12.r))
      .color(context.colorsCustom.TealGreenSecondary)
      .height(60.h)
      .width(Width)
      .padding(EdgeInsetsGeometry.symmetric(horizontal: 16.w))
      .margin(EdgeInsetsGeometry.only(right: 16.w, left: 16.w, bottom: 20.h))
      .make()
      .onTap(() {
        Get.toNamed(Routes.reviewPayMentScreen);
      });
}
