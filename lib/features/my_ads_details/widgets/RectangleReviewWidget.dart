import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';

Widget RectangleReviewWidget(BuildContext context, {required String rating}) {
  int ratingValue = int.parse(rating.split('.')[0]);

  return Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    context.tripEvaluation,
                    style: context.textStyles.titleSmall.medium.copyWith(
                      color: context.colorsCustom.TextPrimary,
                    ),
                  ),
                  horizontalSpace(220.w),
                  Text(
                    '$rating',
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
                        index < ratingValue
                            ? AppAssets.svgs.star_bold_icon
                            : AppAssets.svgs.star_icon,
                        width: 24.w,
                        height: 24.w,
                      ).box
                      .padding(EdgeInsetsGeometry.symmetric(horizontal: 4.w))
                      .make();
                }),
              ).box.height(24.w).width(190.w).make(),
            ],
          ),
        ],
      ).box
      .width(Width.w)
      .padding(EdgeInsetsGeometry.symmetric(horizontal: 16.w, vertical: 18.h))
      .customRounded(BorderRadiusGeometry.circular(4.r))
      .color(context.colorsCustom.LightOrange)
      .make();
}
