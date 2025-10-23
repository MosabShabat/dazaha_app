import '../../../features/home/controller/home_controller.dart';

import '../../../core/constant/exports_widgets.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/widgets/latest_announcements_widget.dart';
import 'details_container_widget.dart';

Widget BottomCustomWidget(BuildContext context, {controller, isOrder}) {
  HomeController homeController = Get.find();
  print('isOrder BottomCustomWidget: $isOrder');
  return Column(
    children: [
      LatestAnnouncementsRowWidget(
        context,
        text: context.trackingLog,
        onPressed: () {
          if (isOrder) {
            homeController.selectedIndex.value = 1;
          } else {
            homeController.selectedIndex.value = 3; // انتقل للتاب 3
          }
        },
        Widget: Text(
          context.viewAll,
          style: context.textStyles.bodySmall.regular.copyWith(
            color: context.colorsCustom.TextSecondary,
            fontSize: 12.sp,
          ),
        ),
      ),
      DetailsContainerWidget(context, controller: controller, isOrder: isOrder),
    ],
  );
}
