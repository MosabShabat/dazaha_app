import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../core/constant/exports_libraries.dart';
import '../../../../features/notifications/widgets/notification_item.dart';
import '../controller/notifications_controller.dart';

Widget NotListWidget(
  BuildContext context, {
  required NotificationsController controller,
}) {
  final RefreshController _refreshController = RefreshController();

  return Obx(() {
    final list = controller.notificationsList;

    return SmartRefresher(
      controller: _refreshController,
      enablePullUp: true,
      onRefresh: () async {
        await controller.refreshNotifications();
        _refreshController.refreshCompleted();
      },
      onLoading: () async {
        await controller.loadMoreNotificationsModel();
        _refreshController.loadComplete();
      },
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        controller: controller.scrollController,
        itemCount:
            list.length +
            (controller.isLoadingMore.value
                ? 1
                : 0), // ✅ إضافة عنصر للتحميل عند النهاية
        itemBuilder: (context, index) {
          if (index == list.length) {
            /// ✅ Loader عند نهاية القائمة
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Center(child: CircularProgressIndicator()),
            );
          }

          /// ✅ عنصر Notification طبيعي
          return buildNotificationItem(
            context,
            notification: list[index],
            index: index,
            totalItems: list.length,
          );
        },
      ),
    );
  });
}
