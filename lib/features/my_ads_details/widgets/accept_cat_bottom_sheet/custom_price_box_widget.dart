import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';

Widget CustomPriceBoxWidget(BuildContext context,{required priceCurr}) {
  return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${context.offeredPriceQuote}',
              textAlign: TextAlign.center,
              style: context.textStyles.bodySmall.medium.copyWith(
                color: context.colorsCustom.TextPrimary,
                fontSize: 12.sp,
              ),
            ),
            verticalSpace(10.h),
            Text(
              priceCurr,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: context.textStyles.headlineSmall.medium.copyWith(
                color: context.colorsCustom.TextPrimary,
              ),
            ).box.alignCenter.make(),
          ],
        ),
      ).box
      .customRounded(BorderRadiusGeometry.all(Radius.circular(8).w))
      .width(Width)
      .height(130.h)
      .padding(EdgeInsetsGeometry.symmetric(vertical: 16.h, horizontal: 16.w))
      // .height(100.h)
      .color(context.colorsCustom.CardBackgroundLightGray)
      .make();
}
