import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/helpers/theme_exports.dart';

Widget InfoPriceWidget(BuildContext context) {
  return Container(
        child: Column(
          children: [
            Text(
              context.theHigherYourPrice,
              textAlign: TextAlign.start,
              maxLines: 100,
              style: context.textStyles.labelSmall.regular.copyWith(
                color: context.colorsCustom.TextPrimary,
              ),
            ),
          ],
        ),
      ).box
      .customRounded(BorderRadius.circular(8.w))
      .padding(EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h))
      .color(context.colorsCustom.LightYellow)
      .make();
}
