import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget CatRowPayWidget(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(8.0.r),
        child: Image.asset(
          AppAssets.images.goku,
          fit: BoxFit.cover,
          height: 100.w,
          width: 100.w,
        ),
      ),
      horizontalSpace(5.w),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(5.h),
          Text(
            'توصيل كرسي مكتب ',
            style: context.textStyles.headlineSmall.medium.copyWith(
              color: context.colorsCustom.TextPrimary,
              fontSize: 16.sp,
            ),
          ),
          verticalSpace(5.h),
          Text(
            'النقل والتوصيل',
            style: context.textStyles.headlineSmall.regular.copyWith(
              color: context.colorsCustom.TextPrimary,
              fontSize: 12.sp,
            ),
          ),
          verticalSpace(7.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 18.w,
                    backgroundImage: AssetImage(AppAssets.images.goku),
                  ),
                  horizontalSpace(5.w),
                  Text(
                    'عباس الجبوري',
                    style: context.textStyles.headlineSmall.medium.copyWith(
                      color: context.colorsCustom.TextPrimary,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
              Text(
                '12,000 د.ع',
                style: context.textStyles.headlineSmall.medium.copyWith(
                  color: context.colorsCustom.TextPrimary,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ).box.width(250.w).make(),
        ],
      ),
    ],
  ).onTap(() {
    Get.toNamed(Routes.itemAdDetailsScreen);
  });
}
