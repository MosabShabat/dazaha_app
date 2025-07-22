import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget AdsDetailsWidget(BuildContext context) {
  return SizedBox(
    height: Width * 0.43,
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 5.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0.r),
                child: Image.asset(
                  AppAssets.images.goku,
                  fit: BoxFit.cover,
                  height: Width * 0.3,
                  width: Width * 0.3,
                ),
              ),
              // verticalSpace(5.h),
              Text(
                'نقل طقم كنب',
                style: context.textStyles.bodySmall.medium.copyWith(
                  color: context.colorsCustom.TextPrimary,
                  fontSize: 12.0.sp,
                ),
              ),

              // verticalSpace(5.h),
              Text(
                '300.0 د.ع',
                style: context.textStyles.bodySmall.bold.copyWith(
                  color: context.colorsCustom.TealGreenSecondary,
                  fontSize: 12.0.sp,
                ),
              ),
            ],
          ),
        ).onTap(() => Get.toNamed(Routes.itemAdDetailsScreen));
      },
    ),
  );
}
