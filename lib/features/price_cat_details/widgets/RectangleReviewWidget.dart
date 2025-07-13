import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget RectangleReviewWidget(BuildContext context) {
  return Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'تقييم الرحلة',
                    style: context.textStyles.titleSmall.medium.copyWith(
                      color: context.colorsCustom.TextPrimary,
                    ),
                  ),
                  horizontalSpace(220.w),
                  Text(
                    '4.5',
                    style: context.textStyles.titleSmall.medium.copyWith(
                      color: context.colorsCustom.TextPrimary,
                    ),
                  ),
                ],
              ),
              verticalSpace(30.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(5, (index) {
                  return SvgPicture.asset(
                        AppAssets.svgs.star_bold_icon,
                        width: 24.w,
                        height: 24.w,
                      ).box
                      .padding(EdgeInsetsGeometry.symmetric(horizontal: 4.w))
                      .make();
                }),
              ).box.height(24.w).width(190.w).make(),
              // verticalSpace(0.h),
            ],
          ),
        ],
      ).box
      .width(Width.w)
      // .height(130.h)
      .padding(EdgeInsetsGeometry.symmetric(horizontal: 16.w, vertical: 18.h))
      .customRounded(BorderRadiusGeometry.circular(4.r))
      .color(context.colorsCustom.LightOrange)
      .make();
}
