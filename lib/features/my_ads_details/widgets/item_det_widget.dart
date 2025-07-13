import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/home_page/widgets/case_container_widget.dart';

Widget ItemDetWidget(BuildContext context) {
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
              fontSize: 14.sp,
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
          verticalSpace(15.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '12,000 د.ع',
                style: context.textStyles.headlineSmall.medium.copyWith(
                  color: context.colorsCustom.TextPrimary,
                  fontSize: 12.sp,
                ),
              ),
              CaseContainerWidget(
                context,
                BackGroundColor: context.colorsCustom.surfacePrimaryWhite,
                height: 30.h,
                text: '${context.details}',
                textColor: context.colorsCustom.TextSecondary,
                textSize: 12.sp,
                horizontalPadding: 15.0.w,
                borderRadius: 8.0.r,
                colorBorder: context.colorsCustom.SecondaryElement,
                onTap: () {},
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
