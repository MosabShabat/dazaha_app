import '../../../core/constant/exports_widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../core/constant/exports_libraries.dart';
import '../../../core/helpers/app_shared_methods.dart';
import '../../../core/widgets/app_empty_data/empty_notifications.dart';
import '../../../core/widgets/app_shimmers/transactions_shimmer_list.dart';
import '../../user_info/widgets/user_info_app_bar_widget.dart';
import '../controller/notifications_controller.dart';
import '../widgets/notification_item.dart';

class NotificationsScreen extends StatelessWidget {
  final NotificationsController _notificationsController = Get.find();
  final RefreshController _refreshController = RefreshController();

  NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _notificationsController.scrollController.addListener(() {
      if (_notificationsController.scrollController.position.extentAfter <
          200) {
        _notificationsController.loadMoreNotificationsModel();
      }
    });

    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: UserInfoAppBarWidget(
        Height: Width * 0.25,
        context,
        widget: Text(
          context.notifications,
          style: context.textStyles.bodyLarge.bold.copyWith(
            color: context.colorsCustom.TextPrimary,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          if (_notificationsController.isLoading.isTrue &&
              _notificationsController.notificationsList.isEmpty) {
            return transactionsListShimmer(context, true);
          } else if (_notificationsController.notificationsList.isEmpty) {
            return EmptyNotifications(context);
          } else {
            return SmartRefresher(
              controller: _refreshController,
              enablePullUp: true,
              onRefresh: () async {
                _notificationsController.resetControllerState();
                await _notificationsController.refreshNotifications();
                _refreshController.refreshCompleted();
              },
              onLoading: () async {
                await _notificationsController.loadMoreNotificationsModel();
                _refreshController.loadComplete();
              },
              child: ListView.builder(
                key: PageStorageKey('notifications_list'),
                controller: _notificationsController.scrollController,
                physics: const BouncingScrollPhysics(),
                itemCount:
                    _notificationsController.notificationsList.length + 1,
                itemBuilder: (context, index) {
                  if (index ==
                      _notificationsController.notificationsList.length) {
                    return _notificationsController.isLoadingMore.value
                        ? Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.h),
                            child: Center(
                              child: AppSharedMethods.buildProgressViewWhite(
                                context,
                                false,
                              ),
                            ),
                          )
                        : const SizedBox();
                  }

                  final notification =
                      _notificationsController.notificationsList[index];
                  return buildNotificationItem(
                    context,
                    notification: notification,
                    index: index,
                    totalItems:
                        _notificationsController.notificationsList.length,
                  );
                },
              ),
            );
          }
        }),
      ),
    );
  }
}
