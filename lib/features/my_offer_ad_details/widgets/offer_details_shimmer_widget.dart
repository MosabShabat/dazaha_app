import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/widgets/app_shimmers/custom_shimmer.dart';

Widget OfferDetailsShimmerWidget() {
  // عناصر البداية
  final baseItems = <Widget>[
    verticalSpace(30.h),
    CustomShimmer(width: 120.w, height: 8.h),
    verticalSpace(6.h),
    CustomShimmer(width: 150.w, height: 6.h),
    verticalSpace(20.h),
    // صور أفقية
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(3, (index) {
          return CustomShimmer(
            width: 175.w,
            height: 175.w,
          ).paddingSymmetric(horizontal: 8.w);
        }),
      ),
    ),
  ];
  // عناصر مخصصة مرة واحدة
  final shimmerSpecs = [
    (70.w, 8.h, 20.h),
    (360.w, 60.h, 20.h),
    (200.w, 8.h, 20.h),
    (70.w, 6.h, 20.h),
    (200.w, 6.h, 5.h),
    (100.w, 6.h, 20.h),
    (360.w, 140.h, 20.h),
  ];
  // العناصر المتكررة (100 ثم 200) ×3
  final repeatedSpecs = List.generate(
    3,
    (i) => [(100.w, 6.h, 20.h), (200.w, 6.h, 20.h)],
  ).expand((e) => e);
  // العنصر الأخير
  final lastSpec = [(100.w, 6.h, 0.h)];
  return Container(
    width: Width.w,
    height: Height.h,
    color: Colors.white,
    child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...baseItems,
            verticalSpace(20.h),
            // ضفنا كل الـ specs مع بعض
            ...[...shimmerSpecs, ...repeatedSpecs, ...lastSpec].map(
              (s) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomShimmer(width: s.$1, height: s.$2, borderRadius: 8.r),
                  if (s.$3 > 0) verticalSpace(s.$3),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
