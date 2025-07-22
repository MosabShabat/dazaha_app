import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget PresentedOfferBoxWidget(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        context.viewPrice,
        style: context.textStyles.bodyLarge.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),
      verticalSpace(10.h),
      ListTile(
            leading: Icon(Icons.price_change),
            contentPadding: EdgeInsets.all(0),
            title: Text(
              context.presentedOffer,
              style: context.textStyles.bodySmall.medium.copyWith(
                color: context.colorsCustom.TextPrimary,
              ),
            ),
            trailing: Text(
              '10,020 د.ع',
              style: context.textStyles.bodyLarge.medium.copyWith(
                color: context.colorsCustom.TextPrimary,
              ),
            ),
          ).box
          .height(60.h)
          .padding(EdgeInsetsGeometry.symmetric(horizontal: 16.w))
          .customRounded(BorderRadiusGeometry.circular(8.r))
          .color(context.colorsCustom.CardBackgroundLightGray)
          .make(),
    ],
  );
}
