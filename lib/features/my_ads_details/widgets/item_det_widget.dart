import 'package:cached_network_image/cached_network_image.dart';
import '../../../../features/choose_the_service/controller/order_data_controller.dart';
import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../features/home_page/widgets/case_container_widget.dart';

Widget ItemDetWidget(
  BuildContext context, {
  required String image,
  required String title,
  required String serviceTitle,
  required String priceCurr,
  required String uuid,
  status,
}) {
  final OrderDataController orderDataController = Get.find();

  void goToDetails() {
    if (status == 'canceled') return;
    orderDataController.setItemUuid(uuid);
    Get.toNamed(Routes.itemAdDetailsScreen);
  }

  return GestureDetector(
    onTap: goToDetails,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // الصورة والعنوان والمعلومات
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.fill,
                height: 100.w,
                width: 100.w,
              ),
            ),
            horizontalSpace(5.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textStyles.headlineSmall.medium.copyWith(
                    color: context.colorsCustom.TextPrimary,
                    fontSize: 14.sp,
                  ),
                ),
                verticalSpace(5.h),
                Text(
                  serviceTitle,
                  style: context.textStyles.headlineSmall.regular.copyWith(
                    color: context.colorsCustom.TextPrimary,
                    fontSize: 12.sp,
                  ),
                ),
                verticalSpace(15.h),
                Text(
                  priceCurr,
                  style: context.textStyles.headlineSmall.medium.copyWith(
                    color: context.colorsCustom.TextPrimary,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
        // زر التفاصيل
        status == 'canceled'
            ? SizedBox.shrink()
            : Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CaseContainerWidget(
                    context,
                    BackGroundColor: context.colorsCustom.surfacePrimaryWhite,
                    height: 30.h,
                    text: context.details,
                    textColor: context.colorsCustom.TextSecondary,
                    textSize: 12.sp,
                    horizontalPadding: 15.w,
                    borderRadius: 8.r,
                    colorBorder: context.colorsCustom.SecondaryElement,
                    onTap: goToDetails,
                  ),
                ],
              ).box.height(100.w).make(),
      ],
    ),
  );
}
