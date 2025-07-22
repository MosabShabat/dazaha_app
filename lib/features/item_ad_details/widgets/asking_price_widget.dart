import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget AskingPriceWidget(BuildContext context) {
  return Column(
    children: [
      Text(
        context.setYourPriceAndBe,
        style: context.textStyles.bodyMedium.bold.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),
      verticalSpace(20.h),
      Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.askingPrice,
                style: context.textStyles.bodySmall.medium.copyWith(
                  color: context.colorsCustom.TextPrimary,
                ),
              ),
              Text(
                '10,020 د.ع',
                style: context.textStyles.bodyMedium.medium.copyWith(
                  color: context.colorsCustom.TextPrimary,
                ),
              ),
            ],
          ).box
          .height(60.h)
          .color(context.colorsCustom.CardBackgroundLightGray)
          .padding(EdgeInsetsGeometry.symmetric(horizontal: 16.w))
          .customRounded(BorderRadiusGeometry.circular(4.r))
          .make(),
      verticalSpace(20.h),
    ],
  );
}
