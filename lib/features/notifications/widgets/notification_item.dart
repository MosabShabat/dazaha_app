import '../../../../core/constant/exports_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/network/models/notifications/notification_item.dart';
import '../../../../../core/theming/app_text_styles.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/helpers/app_shared_data.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/widgets/custom_cached_image.dart';

Widget buildNotificationItem(
  BuildContext context, {
  required NotificationItem? notification,
  required int index,
  required int totalItems,
}) {
  return GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () {
      // if (notification!.type == NotificationTypes.newPurchase) {
      //   Get.toNamed(Routes.chefPurchasesOrderDetailsScreen, arguments: {
      //     AppConstants.uuid: notification.referenceUuid,
      //   });
      // } else if (notification.type == NotificationTypes.purchaseCaptainWay) {
      //   Get.toNamed(Routes.purchasesOrderDetailsScreen, arguments: {
      //     AppConstants.uuid: notification.referenceUuid,
      //   });
      // } else if (notification.type == NotificationTypes.purchaseCompleted) {
      //   Get.toNamed(Routes.chefPurchasesOrderDetailsScreen, arguments: {
      //     AppConstants.uuid: notification.referenceUuid,
      //   });
      // } else if (notification.type == NotificationTypes.newOrder ||
      //     notification.type == NotificationTypes.orderCanceled) {
      //   Get.toNamed(Routes.cookOtherOrdersScreen);
      // } else if (notification.type == NotificationTypes.newOffer ||
      //     notification.type == NotificationTypes.orderCaptainWay) {
      //   Get.toNamed(Routes.cookMeOrderDetailsScreen, arguments: {
      //     AppConstants.uuid: notification.referenceUuid,
      //   });
      // } else if (notification.type == NotificationTypes.orderProgress ||
      //     notification.type == NotificationTypes.orderCompleted) {
      //   Get.toNamed(Routes.chefOfferAndPrivateDetailsScreen, arguments: {
      //     AppConstants.uuid: notification.referenceUuid,
      //   });
      // } else if (notification.type == NotificationTypes.joinJhefAccepted ||
      //     notification.type == NotificationTypes.joinJhefRejected) {
      //   Get.offAllNamed(Routes.navigationBarScreen);
      // } else
      if (notification.type == NotificationTypes.withdrawAccepted ||
          notification.type == NotificationTypes.withdrawRejected ||
          notification.type == NotificationTypes.walletWithdrawal ||
          notification.type == NotificationTypes.walletDeposit) {
        AppSharedData.getUserInfo().then((userData) {
          Get.toNamed(Routes.walletScreen);
        });
      }
      //else if (notification.type ==
      //         NotificationTypes.accountVerificationAccepte ||
      //     notification.type == NotificationTypes.accountVerificationRejecte) {
      //   Get.toNamed(Routes.navigationBarScreen);
      //   if (Get.isRegistered<HomeController>()) {
      //     HomeController controller = Get.find();
      //     controller.getLocation();
      //   }
      // }
      else if (notification.type == NotificationTypes.depositOrder) {
        AppSharedData.getUserInfo().then((userData) {
          Get.toNamed(Routes.walletScreen);
        });
      }
    },
    //OrdersSerModel
    child: Container(
      margin: EdgeInsets.only(top: index == 0 ? 24 : 16),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomCachedImage(
            imageUrl: notification?.image ?? '',
            width: 65.w,
            height: 65.w,
            borderRadius: 32.5.r,
            fit: BoxFit.fill,
          ),
          horizontalSpace(10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      notification?.title ?? '',
                      style: AppTextStyles.font12Grey400Regular(context),
                    ),
                    notification!.isSeen!
                        ? Container()
                        : CircleAvatar(
                            radius: 3.r,
                            backgroundColor:
                                context.colorsCustom.TealGreenSecondary,
                          ),
                  ],
                ),
                verticalSpace(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                      notification.body ?? '',
                      style: AppTextStyles.font12Black500Medium(context),
                    ),
                    Text(
                      notification.timeAgo ?? '',
                      style: AppTextStyles.font12Grey400Regular(context),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
