import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/helpers/spacing.dart';
import 'package:dazaha_app/core/helpers/theme_exports.dart';

Widget TimeDateColumnWidget(
  BuildContext context, {
  required img,
  required imgText,
  required bulText,
}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(img, color: context.colorsCustom.TextSecondary),
          5.widthBox,
          Text(
            '${imgText}',
            textAlign: TextAlign.center,
            maxLines: 1,
            style: context.textStyles.labelMedium.medium.copyWith(
              color: context.colorsCustom.TextSecondary,
            ),
          ),
        ],
      ),
      verticalSpace(10.h),
      SizedBox(
        height: Width * 0.1,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
                  child: Center(
                    child: Text(
                      '${bulText}',
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: context.textStyles.labelMedium.medium.copyWith(
                        color: context.colorsCustom.TextPrimary,
                      ),
                    ),
                  ),
                ).box
                // .width(90.w)
                .padding(EdgeInsetsGeometry.symmetric(horizontal: 5.w))
                .margin(EdgeInsetsGeometry.symmetric(horizontal: 5.w))
                .customRounded(BorderRadiusGeometry.all(Radius.circular(8.r)))
                .color(context.colorsCustom.CardBackgroundLightGray)
                .make();
          },
        ),
      ),
    ],
  );
}
