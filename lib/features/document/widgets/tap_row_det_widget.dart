import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/home_page/widgets/case_container_widget.dart';

Widget TapRowDetWidget(BuildContext context) {
  return ListView.builder(
    // shrinkWrap: true,
    itemCount: 5,
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.only(bottom: 10.h),
        child:
            Row(
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'توصيل كرسي مكتب ',
                      style: context.textStyles.headlineSmall.medium.copyWith(
                        color: context.colorsCustom.TextPrimary,
                        fontSize: 14.sp,
                      ),
                    ),
                    // verticalSpace(10.h),
                    Text(
                      'النقل والتوصيل',
                      style: context.textStyles.headlineSmall.regular.copyWith(
                        color: context.colorsCustom.TextPrimary,
                        fontSize: 12.sp,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.dashboard),
                        horizontalSpace(5.w),
                        Text(
                          '12,000 د.ع',
                          style: context.textStyles.bodySmall.medium.copyWith(
                            color: context.colorsCustom.TextPrimary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ).box.height(100.w).make(),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CaseContainerWidget(
                      context,
                      BackGroundColor: context.colorsCustom.LightBlue,
                      height: 30.h,
                      text: '${context.receiveOffers}',
                      textColor: context.colorsCustom.BluePrimary,
                      textSize: 12.sp,
                      horizontalPadding: 8.0.w,
                      borderRadius: 20.0.r,
                      onTap: () {},
                    ),
                    Text(
                      'منذ 5 دقائق',
                      style: context.textStyles.bodySmall.regular.copyWith(
                        color: context.colorsCustom.TextSecondary,
                      ),
                    ),
                  ],
                ).box.height(100.w).make(),
              ],
            ).onTap(() {
              // Get.toNamed(Routes.myAdsDetailsScreen);
              if (index == 0) {
                Get.toNamed(
                  Routes.myOfferAdDetailsScreen,
                  arguments: {
                    'isShow': true,
                    'page': Get.toNamed(
                      Routes.myOfferAdDetailsScreen,
                      arguments: {'isShow': true},
                    ),
                  },
                );
              }
              if (index == 1) {
                // Get.toNamed(Routes.myAdsDetailsScreen, arguments: 1);
              }
              if (index == 2) {
                // Get.toNamed(Routes.myAdsDetailsScreen, arguments: 2);
              }
              // or any int you want

              print('000000000000000 ${index} 000000000000000');
            }),
      );
    },
  );
}
