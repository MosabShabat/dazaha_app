import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/home_page/widgets/case_container_widget.dart';

Widget RowDetCasWidget(BuildContext context) {
  return ListView.builder(
    // shrinkWrap: true,
    itemCount: 5,
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h),
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
                    height: 120.w,
                    width: 120.w,
                  ),
                ),
                horizontalSpace(5.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'توصيل كرسي مكتب ',
                      style: context.textStyles.headlineSmall.medium.copyWith(
                        color: context.colorsCustom.TextPrimary,
                        fontSize: 14.sp,
                      ),
                    ),
                    verticalSpace(10.h),
                    Text(
                      'النقل والتوصيل',
                      style: context.textStyles.headlineSmall.regular.copyWith(
                        color: context.colorsCustom.TextPrimary,
                        fontSize: 12.sp,
                      ),
                    ),

                    verticalSpace(10.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.dashboard),
                        horizontalSpace(5.w),
                        Text(
                          '12,000 د.ع',
                          style: context.textStyles.headlineSmall.medium
                              .copyWith(
                                color: context.colorsCustom.TextPrimary,
                                fontSize: 12.sp,
                              ),
                        ),
                      ],
                    ),
                    verticalSpace(15.h),
                    Text(
                      '10 عروض مقدمة',
                      style: context.textStyles.headlineSmall.bold.copyWith(
                        color: context.colorsCustom.TealGreenSecondary,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
                Spacer(),
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
              ],
            ).onTap(() {
              // Get.toNamed(Routes.myAdsDetailsScreen);
              if (index == 0) {
                Get.toNamed(Routes.myAdsDetailsScreen, arguments: 0);
              }
              if (index == 1) {
                Get.toNamed(Routes.myAdsDetailsScreen, arguments: 1);
              }
              if (index == 2) {
                Get.toNamed(Routes.myAdsDetailsScreen, arguments: 2);
              }
              // or any int you want

              print('000000000000000 ${index} 000000000000000');
            }),
      );
    },
  );
}
