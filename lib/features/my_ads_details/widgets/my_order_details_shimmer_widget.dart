import '../../../core/widgets/app_shimmers/custom_shimmer.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';

Widget MyOrderDetailsShimmerWidget() {
  return Container(
    width: Width.w,
    height: Height.h,
    color: Colors.white,
    child: SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// العنوان
              CustomShimmer(width: 100.w, height: 25.h, borderRadius: 8.r),
              verticalSpace(20.h),
              CustomShimmer(width: 120.w, height: 8.h, borderRadius: 8.r),
              verticalSpace(8.h),
              CustomShimmer(width: 160.w, height: 5.h, borderRadius: 8.r),
              verticalSpace(20.h),

              /// صورة + تفاصيل
              Row(
                children: [
                  CustomShimmer(width: 100.w, height: 100.w, borderRadius: 8.r),
                  horizontalSpace(8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      _SmallLine(width: 140, height: 8),
                      _SmallLine(width: 70, height: 5),
                      _SmallLine(width: 65, height: 5),
                    ],
                  ).box.height(100.w).make(),
                ],
              ),
              verticalSpace(20.h),

              /// قسم آخر
              CustomShimmer(width: 80.w, height: 8.h, borderRadius: 8.r),
              verticalSpace(8.h),
              CustomShimmer(width: 90.w, height: 5.h, borderRadius: 8.r),
              verticalSpace(20.h),

              /// أزرار (3 أعمدة)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  3,
                  (index) => CustomShimmer(
                    width: 110.w,
                    height: 40.h,
                    borderRadius: 8.r,
                  ),
                ),
              ),
              verticalSpace(20.h),

              /// القائمة المكررة (5 عناصر)
              Column(
                children: List.generate(
                  5,
                  (index) => Padding(
                    padding: EdgeInsets.only(bottom: 15.h),
                    child: _OrderItemShimmer(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

/// 🔹 عنصر مخصص لسطر صغير
class _SmallLine extends StatelessWidget {
  final double width;
  final double height;
  const _SmallLine({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: CustomShimmer(width: width.w, height: height.h, borderRadius: 8.r),
    );
  }
}

/// 🔹 عنصر مكرر (الصورة + النصوص + السعر/زر)
class _OrderItemShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// صورة
        CustomShimmer(width: 85.w, height: 85.w, borderRadius: 8.r),
        horizontalSpace(8.w),

        /// تفاصيل يسار
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _SmallLine(width: 70, height: 8),
            _SmallLine(width: 35, height: 5),
            _SmallLine(width: 113, height: 5),
          ],
        ).box.height(85.w).make(),
        horizontalSpace(50.w),

        /// تفاصيل يمين
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomShimmer(width: 70.w, height: 8.h, borderRadius: 8.r),
            verticalSpace(8.h),
            CustomShimmer(width: 80.w, height: 30.h, borderRadius: 8.r),
          ],
        ).box.height(85.w).make(),
      ],
    );
  }
}
