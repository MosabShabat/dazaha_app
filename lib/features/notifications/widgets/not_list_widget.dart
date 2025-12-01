// import '../../../../core/constant/exports_libraries.dart';
// import '../../../../features/notifications/widgets/notification_item.dart';
// import '../../../core/helpers/app_shared_methods.dart';
// import '../controller/notifications_controller.dart';

// Widget NotListWidget(
//   BuildContext context, {
//   required NotificationsController controller,
// }) {
//   return Obx(() {
//     final list = controller.notificationsList;

//     return ListView.builder(
//       key: PageStorageKey('notifications_list'),
//       physics: const BouncingScrollPhysics(),
//       itemCount: list.length + 1,
//       itemBuilder: (context, index) {
//         if (index == list.length) {
//           return controller.isLoadingMore.value
//               ? Padding(
//                   padding: EdgeInsets.symmetric(vertical: 20.h),
//                   child: Center(
//                     child: AppSharedMethods.buildProgressViewWhite(
//                       context,
//                       false,
//                     ),
//                   ),
//                 )
//               : const SizedBox();
//         }

//         final notification = list[index];
//         return buildNotificationItem(
//           context,
//           notification: notification,
//           index: index,
//           totalItems: list.length,
//         );
//       },
//     );
//   });
// }
