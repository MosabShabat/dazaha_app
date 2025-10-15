import '../../../../core/constant/exports_widgets.dart';

import '../../constant/exports_libraries.dart';
import 'custom_shimmer.dart';

Widget CustomShimmerHome() {
  return SingleChildScrollView(
    physics: NeverScrollableScrollPhysics(),
    child: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomShimmer(
                      width: 60.w,
                      height: 60.w,
                      borderRadius: 60.r,
                    ),
                    horizontalSpace(5.w),
                    Column(
                      children: [
                        CustomShimmer(width: 60.w, height: 6.h),
                        verticalSpace(10.h),
                        CustomShimmer(width: 40.w, height: 6.h),
                      ],
                    ),
                  ],
                ),
                CustomShimmer(width: 40.w, height: 40.h, borderRadius: 60.r),
              ],
            ),
            verticalSpace(10.h),
            CustomShimmer(width: Width.w, height: 120.h),
            verticalSpace(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(ListImagesHome.length, (index) {
                return Column(
                  children: [
                    CustomShimmer(width: 70.w, height: 70.w, borderRadius: 50),
                    verticalSpace(10.h),
                    CustomShimmer(width: 50.w, height: 6.w),
                  ],
                );
              }),
            ),
            verticalSpace(30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomShimmer(width: 70.w, height: 6.h),
                CustomShimmer(width: 50.w, height: 6.h),
              ],
            ),
            verticalSpace(20.h),
            SizedBox(
              height: Width * 0.43,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 5.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomShimmer(
                          height: Width * 0.3,
                          width: Width * 0.3,
                          borderRadius: 8.0.r,
                        ),
                        CustomShimmer(
                          height: 6.h,
                          width: 50.w,
                          borderRadius: 8.0.r,
                        ),
                        CustomShimmer(
                          height: 6.h,
                          width: 35.w,
                          borderRadius: 8.0.r,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            verticalSpace(30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomShimmer(width: 70.w, height: 6.h),
                CustomShimmer(width: 50.w, height: 6.h),
              ],
            ),
            verticalSpace(30.h),
            CustomShimmer(width: 360.w, height: 120.h, borderRadius: 12.r),
          ],
        ),
      ),
    ),
  );
}
