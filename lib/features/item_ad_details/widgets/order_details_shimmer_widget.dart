import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/widgets/app_shimmers/custom_shimmer.dart';

Widget OrderDetailsShimmerWidget(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomShimmer(width: 500.w, height: 400.h),
      verticalSpace(20.h),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(20.h),
          CustomShimmer(width: 30.w, height: 6.h).box.alignCenter.make(),
          verticalSpace(20.h),
          CustomShimmer(width: 200.w, height: 15.h),
          verticalSpace(20.h),
          CustomShimmer(width: 30.w, height: 15.h),
          verticalSpace(20.h),
          CustomShimmer(width: 200.w, height: 15.h),
          verticalSpace(20.h),
          CustomShimmer(width: 200.w, height: 15.h),
          verticalSpace(20.h),
          CustomShimmer(width: 50.w, height: 15.h),
          verticalSpace(20.h),
          CustomShimmer(width: 50.w, height: 15.h),
          verticalSpace(20.h),
          CustomShimmer(width: 50.w, height: 15.h),
        ],
      ).paddingSymmetric(horizontal: 16.w),
    ],
  ).box.color(context.colorsCustom.surfacePrimaryWhite).make();
}
