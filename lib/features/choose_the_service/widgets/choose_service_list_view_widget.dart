import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/widgets/app_shimmers/custom_shimmer.dart';
import '../../home_page/controller/home_page_controller.dart';
import '../controller/choose_the_service_controller.dart';
import '../controller/order_data_controller.dart';
import 'buy_me_widgets/second_item_bottom_sheet_widget.dart';
import 'custom_camera_screen.dart';
import 'text_service_widget.dart';
import 'transportation_and_delivery_widgets/first_item_bottom_sheet_widget.dart';

Widget ChooseServiceListViewWidget(
  BuildContext context, {
  required HomePageController controller,
  required OrderDataController orderController,
}) {
  final services = controller.homeModel.value?.services ?? [];
  final ChooseTheServiceController chooseTheServiceController = Get.find();

  return SizedBox(
    width: Width,
    height: Height / 1.5,
    child: ListView.builder(
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];
        return Obx(() {
          if (controller.isLoading.isTrue) {
            return CustomShimmer(
              width: Width.w,
              height: 70.w,
              borderRadius: 12.r,
            );
          }

          void openServiceSheet() {
            orderController.serviceUuid.value = '';
            orderController
              ..setServiceUuid(service.uuid ?? '')
              ..setServiceName(service.title ?? '')
              ..serviceNumber('$index');
            chooseTheServiceController.getIntro(
              "${orderController.serviceUuid}",
            );

            switch (index) {
              case 0:
                FirstItemBottomSheetWidget(
                  context,
                  controller: chooseTheServiceController,
                );
                break;
              case 1:
                SecondItemBottomSheetWidget(
                  context,
                  topTitle: context.buyForMe,
                  controller: chooseTheServiceController,
                  onTap: () {
                    Get.back();
                    if (chooseTheServiceController
                        .serviceModel!
                        .value
                        .intros!
                        .isEmpty) {
                      Get.toNamed(
                        Routes.bookingDateScreen,
                        arguments: {
                          'page': Routes.buyMeScreen,
                          'pageArgs': null,
                        },
                      );
                    } else if (chooseTheServiceController
                        .serviceModel!
                        .value
                        .intros!
                        .isNotEmpty) {
                      Get.toNamed(Routes.removeAndRecycleServiceFeaturesScreen);
                    }
                  },
                );
                break;
              case 2:
                SecondItemBottomSheetWidget(
                  context,
                  topTitle: context.removeAndRecycle,
                  controller: chooseTheServiceController,
                  onTap: () {
                    Get.back();
                    if (chooseTheServiceController
                        .serviceModel!
                        .value
                        .intros!
                        .isEmpty) {
                      Get.to(
                        () => CustomCameraScreen(
                          page: Routes.bookingDateScreen,
                          arguments: {
                            'page': Routes.adDetailsScreen,
                            'pageArgs': {
                              'page': Routes.advertisementSummaryScreen,
                              'isSwitchShow': true,
                            },
                          },
                        ),
                      );
                      // CustomCameraScreen(
                      //   page: Routes.bookingDateScreen,
                      //   arguments: {
                      //     'page': Routes.adDetailsScreen,
                      //     'pageArgs': {
                      //       'page': Routes.advertisementSummaryScreen,
                      //       'isSwitchShow': true,
                      //     },
                      //   },
                      // );
                      // chooseTheServiceController.openCameraWithPermission(
                      //   context,
                      //   page: Routes.bookingDateScreen,
                      //   arguments: {
                      //     'page': Routes.adDetailsScreen,
                      //     'pageArgs': {
                      //       'page': Routes.advertisementSummaryScreen,
                      //       'isSwitchShow': true,
                      //     },
                      //   },
                      // );
                    } else if (chooseTheServiceController
                        .serviceModel!
                        .value
                        .intros!
                        .isNotEmpty) {
                      Get.toNamed(Routes.removeAndRecycleServiceFeaturesScreen);
                    }
                  },
                );
                break;
              case 3:
                SecondItemBottomSheetWidget(
                  context,
                  topTitle: context.dedication,
                  controller: chooseTheServiceController,
                  onTap: () {
                    Get.back();
                    if (chooseTheServiceController
                        .serviceModel!
                        .value
                        .intros!
                        .isEmpty) {
                      Get.to(
                        () => CustomCameraScreen(
                          page: Routes.bookingDateScreen,
                          arguments: {
                            'page': Routes.adDetailsScreen,
                            'pageArgs': {
                              'page': Routes.advertisementSummaryScreen,
                              'isSwitchShow': true,
                            },
                          },
                        ),
                      );
                      // CustomCameraScreen(
                      //   page: Routes.bookingDateScreen,
                      //   arguments: {
                      //     'page': Routes.adDetailsScreen,
                      //     'pageArgs': {
                      //       'page': Routes.advertisementSummaryScreen,
                      //       'isSwitchShow': true,
                      //     },
                      //   },
                      // );
                      // chooseTheServiceController.openCameraWithPermission(
                      //   context,
                      //   page: Routes.bookingDateScreen,
                      //   arguments: {
                      //     'page': Routes.adDetailsScreen,
                      //     'pageArgs': {
                      //       'page': Routes.advertisementSummaryScreen,
                      //       'isSwitchShow': true,
                      //     },
                      //   },
                      // );
                    } else if (chooseTheServiceController
                        .serviceModel!
                        .value
                        .intros!
                        .isNotEmpty) {
                      Get.toNamed(Routes.removeAndRecycleServiceFeaturesScreen);
                    }
                  },
                );
                break;
            }
          }

          return GestureDetector(
            onTap: openServiceSheet,
            child: Container(
              margin: EdgeInsets.only(bottom: 20.h),
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              width: Width,
              decoration: BoxDecoration(
                color: context.colorsCustom.surfacePrimaryWhite,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: context.colorsCustom.CardBorder.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: context.colorsCustom.BlueBlue,
                    radius: 35.r,
                    child: CachedNetworkImage(
                      imageUrl: service.image ?? '',
                      fit: BoxFit.contain,
                      width: 40.w,
                      height: 40.w,
                    ),
                  ),
                  horizontalSpace(20.w),
                  Expanded(
                    child: TextServiceWidget(
                      context,
                      color1: context.colorsCustom.TextPrimary,
                      text1: service.title ?? '',
                      size1: 12.sp,
                      fontFamily1:
                          context.textStyles.labelMedium.medium.fontFamily!,
                      color2: context.colorsCustom.TextSecondary,
                      text2: service.description ?? '',
                      size2: 12.sp,
                      fontFamily2:
                          context.textStyles.labelMedium.regular.fontFamily,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      },
    ),
  );
}
