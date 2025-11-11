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
  final OrderDataController _orderDataController = Get.find();

  return GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () async {
      _orderDataController.itemUuid.value = '';
      AppConstants.orderUuid = '';
      if (notification == null) return;

      String type = notification.type ?? '';
      String referenceUuid = notification.referenceUuid ?? '';

      print('Notification Type: $type');

      /// 🟢 إشعارات عامة
      if (type == NotificationTypes.general ||
          type == NotificationTypes.requestToJoinDriverAccepted ||
          type == NotificationTypes.requestToJoinDriverRejected ||
          type == NotificationTypes.reportedProblemNew ||
          type == NotificationTypes.reportedProblemInProgress ||
          type == NotificationTypes.reportedProblemResolved) {
        Get.toNamed(Routes.notificationsScreen);
        return;
      }

      /// 🟣 الدعم الفني
      if (type == NotificationTypes.newTechnicalSupportMessage) {
        Get.toNamed(
          Routes.reportAProblemChatSupportScreen,
          arguments: {
            AppConstants.liveSupport: true,
            AppConstants.uuid: 'technical_support',
            AppConstants.receiverImage: 'image_url',
            AppConstants.receiverName: 'Support Bot',
            AppConstants.receiverVerify: true,
          },
        );
        return;
      }

      /// 🟠 طلب جديد
      if (type == NotificationTypes.newOrder) {
        _orderDataController.setItemUuid(referenceUuid);
        print(
          '_orderDataController.setItemUuid(referenceUuid) : ${_orderDataController.itemUuid.value}',
        );
        Get.toNamed(Routes.itemAdDetailsScreen, arguments: {"isShow": true});
        return;
      }

      /// 🟡 عرض جديد
      if (type == NotificationTypes.newOffer ||
          type == NotificationTypes.orderCompleted ||
          type == NotificationTypes.orderDelivered ||
          type == NotificationTypes.orderStarted ||
          type == NotificationTypes.orderCanceled) {
        _orderDataController.setItemUuid(referenceUuid);
        print(
          '_orderDataController.setItemUuid(referenceUuid) : ${_orderDataController.itemUuid.value}',
        );
        Get.toNamed(Routes.myAdsDetailsScreen);
        return;
      }

      /// 🔵 الطلبات (قيد التنفيذ، مكتملة، تم البدء، ... إلخ)
      if (type == NotificationTypes.orderInProgress) {
        if (referenceUuid.isNotEmpty) {
          _orderDataController.setItemUuid(referenceUuid);
          Get.toNamed(Routes.myOfferAdDetailsScreen);

          // if (type == NotificationTypes.orderInProgress) {
          //   _orderDataController.setItemStatus('in_progress');
          //   Get.toNamed(Routes.myOfferAdDetailsScreen);
          // } else if (type == NotificationTypes.orderStarted) {
          //   _orderDataController.setItemStatus('in_progress');
          //   Get.toNamed(Routes.myOfferAdDetailsScreen);
          // } else if (type == NotificationTypes.orderDelivered ||
          //     type == NotificationTypes.orderCompleted) {
          //   _orderDataController.setItemStatus('completed');
          //   Get.toNamed(Routes.myOfferAdDetailsScreen);
          // } else {
          //   Get.offAllNamed(Routes.homeScreen, arguments: {'selectedIndex': 1});
          // }
        } else {
          Get.offAllNamed(Routes.homeScreen, arguments: {'selectedIndex': 1});
        }
        return;
      }

      /// 🟤 العروض (تم استبعاده)
      if (type == NotificationTypes.offerExcluded) {
        Get.offAllNamed(Routes.homeScreen, arguments: {'selectedIndex': 3});
        return;
      }

      /// 🟢 المحفظة
      if (type == NotificationTypes.depositOrder ||
          type == NotificationTypes.depositCanceledOrder ||
          type == NotificationTypes.withdrawAccepted ||
          type == NotificationTypes.withdrawRejected ||
          type == NotificationTypes.walletWithdrawal ||
          type == NotificationTypes.walletDeposit) {
        Get.toNamed(Routes.walletScreen);
        return;
      }
    },

    /// 🎨 تصميم العنصر
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
                    notification?.isSeen == true
                        ? const SizedBox()
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
                      notification?.body ?? '',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.font12Black500Medium(context),
                    ).box.width(200.w).make(),
                    Text(
                      notification?.timeAgo ?? '',
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
