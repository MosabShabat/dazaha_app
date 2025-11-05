import '../../../../core/constant/exports_widgets.dart';
import '../../../../../core/network/models/notifications/notification_item.dart';
import '../../../../../core/theming/app_text_styles.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/widgets/custom_cached_image.dart';
import '../../choose_the_service/controller/order_data_controller.dart';

Widget buildNotificationItem(
  BuildContext context, {
  required NotificationItem? notification,
  required int index,
  required int totalItems,
}) {
  OrderDataController _orderDataController = Get.find();
  return GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () async {
      // if (notification == null) return;

      String type = notification.type ?? '';
      String? referenceUuid = notification.referenceUuid;

      // General / Notifications
      if (type == NotificationTypes.general ||
          type == NotificationTypes.requestToJoinDriverAccepted ||
          type == NotificationTypes.requestToJoinDriverRejected ||
          type == NotificationTypes.reportedProblemNew ||
          type == NotificationTypes.reportedProblemInProgress ||
          type == NotificationTypes.reportedProblemResolved) {
        Get.toNamed(Routes.notificationsScreen);
      }

      // Orders
      if (type == NotificationTypes.newOffer ||
          type == NotificationTypes.newOrder ||
          type == NotificationTypes.orderCanceled ||
          type == NotificationTypes.orderCompleted ||
          type == NotificationTypes.orderInProgress) {
        if (referenceUuid != null && referenceUuid.isNotEmpty) {
          if (type == NotificationTypes.newOffer) {
            _orderDataController.setItemUuid('${referenceUuid}');
            Get.toNamed(Routes.myAdsDetailsScreen);
          } else if (type == NotificationTypes.newOrder) {
            _orderDataController.setItemUuid('${referenceUuid}');
            Get.toNamed(
              Routes.itemAdDetailsScreen,
              arguments: {"isShow": true},
            );
          } else if (type == NotificationTypes.orderInProgress ||
              type == NotificationTypes.orderCompleted) {
            print('Here tap');
            int tabIndex = 0;

            // تحديد أي تبويب نريد فتحه داخل DocumentScreen
            if (type == NotificationTypes.orderInProgress) {
              tabIndex = 1; // التبويب الثاني

              Get.offAllNamed(
                Routes.homeScreen,
                arguments: {
                  'selectedIndex': 3, // صفحة DocumentScreen
                  'tabIndex': tabIndex, // أي تبويب نريد فتحه
                },
              );
            } else if (type == NotificationTypes.orderCompleted) {
              tabIndex = 2; // التبويب الثالث
              Get.offAllNamed(
                Routes.homeScreen,
                arguments: {
                  'selectedIndex': 1, // صفحة DocumentScreen
                  'tabIndex': tabIndex, // أي تبويب نريد فتحه
                },
              );
            }
          }
        } else {
          Get.offAllNamed(
            Routes.homeScreen,
            arguments: {'selectedIndex': 1}, // Order screen
          );
        }
      }

      // Offers
      if (type == NotificationTypes.offerExcluded) {
        Get.offAllNamed(
          Routes.homeScreen,
          arguments: {'selectedIndex': 3}, // Offer screen
        );
        // if (referenceUuid != null && referenceUuid.isNotEmpty) {
        //   _orderDataController.setItemUuid('${referenceUuid}');
        //   Get.toNamed(Routes.myOfferAdDetailsScreen);
        // } else {
        //   Get.offAllNamed(
        //     Routes.homeScreen,
        //     arguments: {'selectedIndex': 3}, // Offer screen
        //   );
        // }
      }

      // Wallet
      if (type == NotificationTypes.withdrawAccepted ||
          type == NotificationTypes.withdrawRejected ||
          type == NotificationTypes.walletWithdrawal ||
          type == NotificationTypes.walletDeposit ||
          type == NotificationTypes.depositOrder ||
          type == NotificationTypes.depositCanceledOrder) {
        Get.toNamed(Routes.walletScreen);
      }
    },
    child: Container(
      margin: EdgeInsets.only(
        top: index == 0 ? 24 : 16,
        left: 16.w,
        right: 16.w,
        bottom: index == totalItems - 1 ? 24 : 0,
      ),
      child: Row(
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
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.font12Black500Medium(context),
                    ).box.width(200.w).make(),
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
