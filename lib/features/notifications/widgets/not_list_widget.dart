import '../../../../core/constant/exports_libraries.dart';
import '../../../../features/notifications/widgets/notification_item.dart';

import '../controller/notifications_controller.dart';

Widget NotListWidget(
  BuildContext context, {
  required NotificationsController controller,
}) {
  return Obx(() {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: controller.notificationsList.length,
      controller: controller.scrollController,

      itemBuilder: (context, index) {
        if (index < controller.notificationsList.length) {
        } else if (controller.isLoadingMore.value) {}
        var notification = controller.notificationsList[index];

        return buildNotificationItem(
          context,
          notification: notification,
          index: index,
          totalItems: controller.notificationsList.length,
        );
      },
    );
  });
}
