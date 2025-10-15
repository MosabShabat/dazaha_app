import '../../../core/constant/exports_widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../core/constant/exports_libraries.dart';
import '../../../core/helpers/app_shared_methods.dart';
import '../../../core/widgets/app_empty_data/empty_notifications.dart';
import '../../../core/widgets/app_shimmers/transactions_shimmer_list.dart';
import '../../../core/widgets/general_screen_widget.dart';
import '../../user_info/widgets/user_info_app_bar_widget.dart';
import '../controller/notifications_controller.dart';
import '../widgets/not_list_widget.dart';

class NotificationsScreen extends StatelessWidget {
  final NotificationsController _notificationsController = Get.find();
  final RefreshController _refreshController = RefreshController();

  NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _notificationsController.resetControllerState();
    _notificationsController.getNotifications();

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
      body: GeneralScreenWidget(
        context,
        wid: [
          SizedBox(
            height: Height.h * 2,
            child: SmartRefresher(
              controller: _refreshController,
              onRefresh: () async {
                await _notificationsController.refreshNotifications();
                _refreshController.refreshCompleted();
              },
              header: CustomHeader(
                builder: (BuildContext context, RefreshStatus? status) {
                  return Container(
                    height: 60.h,
                    color: context.colorsCustom.surfacePrimaryWhite,
                    child: AppSharedMethods.buildProgressViewWhite(
                      context,
                      false,
                    ),
                  );
                },
              ),
              child: Obx(() {
                return _notificationsController.isLoading.isTrue
                    ? transactionsListShimmer(context, true)
                    : _notificationsController.notificationsList.isEmpty
                    ? EmptyNotifications(context)
                    : NotListWidget(
                        context,
                        controller: _notificationsController,
                      );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
