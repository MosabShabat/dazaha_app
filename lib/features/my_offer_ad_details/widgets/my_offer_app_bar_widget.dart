import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../features/my_offer_ad_details/widgets/app_bar_bottom_sheet_widget.dart';
import '../../../core/helpers/constants.dart';
// import '../../home/controller/home_controller.dart';

AppBar MyOfferAppBarWidget(
  BuildContext context, {
  required offerOrOrder,
  required status,
  required uuid,
  required timeLen,
  required timeItem,
  required price,
  required curr,
  required backStatus,
  required KeyboardDoneController doneController,
  required statusBack,
}) {
  print('MyOfferAppBarWidget backStatus: $backStatus');
  return AppBar(
    surfaceTintColor: context.colorsCustom.surfacePrimaryWhite,
    backgroundColor: context.colorsCustom.surfacePrimaryWhite,
    leading: Padding(
      padding: EdgeInsets.all(10.0.w),
      child:
          Container(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 8.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.r),
              color: context.colorsCustom.surfacePrimaryWhite,
            ),
            child: Center(child: Icon(Icons.arrow_back_ios)),
          ).onTap(() {
            if (AppConstants.screenName == 'allAds') {
              Get.toNamed(Routes.allAdsScreen);
            } else {
              Get.back();
              // print('offerOrOrder: $offerOrOrder');

              // if (backStatus == 'completed' || backStatus == 'in_progress') {
              //   HomeController homeController = Get.find<HomeController>();
              //   homeController.extraTabIndex.value = backStatus == 'completed'
              //       ? 2
              //       : backStatus == 'in_progress'
              //       ? 1
              //       : 0;
              //   print('offerOrOrder here 1');
              //   print(
              //     'offerOrOrder here 1 :${homeController.extraTabIndex.value}',
              //   );

              //   Get.offAllNamed(
              //     Routes.homeScreen,
              //     arguments: {
              //       'selectedIndex': offerOrOrder == 'offer' ? 3 : 1,
              //       'tabIndex': backStatus == 'completed'
              //           ? 2
              //           : backStatus == 'in_progress'
              //           ? 1
              //           : 0,
              //     },
              //   );
              // } else if (backStatus == 'home2') {
              //   print('offerOrOrder here 2');
              //   HomeController homeController = Get.find<HomeController>();
              //   homeController.extraTabIndex.value = statusBack == 'completed'
              //       ? 2
              //       : statusBack == 'in_progress'
              //       ? 1
              //       : 0;
              //   ;
              //   print(
              //     'offerOrOrder here 2 :${homeController.extraTabIndex.value}',
              //   );

              //   Get.offAllNamed(
              //     Routes.homeScreen,
              //     arguments: {
              //       'selectedIndex': 1,
              //       'tabIndex': statusBack == 'completed'
              //           ? 2
              //           : statusBack == 'in_progress'
              //           ? 1
              //           : 0,
              //     },
              //   );

              //   // {
              //   //   Get.offAllNamed(
              //   //     Routes.homeScreen,
              //   //     arguments: {'selectedIndex': 1},
              //   //   );
              //   // }
              // } else {
              //   print('offerOrOrder here 3');

              //   Get.offAllNamed(
              //     Routes.homeScreen,
              //     arguments: {'selectedIndex': 3},
              //   );
              // }
            }
          }),
    ),
    actions: [
      status == 'pending'
          ? Row(
              children: [
                Icon(
                      Icons.more_horiz,
                      color: context.colorsCustom.surfacePrimaryBlack,
                    ).box
                    .customRounded(BorderRadiusGeometry.circular(24.r))
                    .border(
                      color: context.colorsCustom.surfacePrimaryBlack,
                      width: 2.w,
                    )
                    .make()
                    .onTap(() {
                      AppBarBottomSheetWidget(
                        context,
                        uuid: uuid,
                        offerOrOrder: offerOrOrder,
                        curr: curr,
                        price: price,
                        timeItem: timeItem,
                        timeLen: timeLen,
                        doneController: doneController,
                      );
                    }),
                horizontalSpace(10.w),
                Text(
                  offerOrOrder == 'offer'
                      ? context.displayManagement
                      : context.advertisingManagement,
                  style: context.textStyles.bodySmall.medium.copyWith(
                    color: context.colorsCustom.TextPrimary,
                  ),
                ),
                horizontalSpace(16.w),
              ],
            )
          : Container(),
    ],
  );
}
