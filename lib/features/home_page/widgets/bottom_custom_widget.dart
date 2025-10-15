import '../../../core/constant/exports_widgets.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/widgets/latest_announcements_widget.dart';
import 'details_container_widget.dart';

Widget BottomCustomWidget(BuildContext context, {controller, isOrder}) {
  return Column(
    children: [
      LatestAnnouncementsRowWidget(
        context,
        text: context.trackingLog,
        onPressed: () {
          isOrder
              ? Get.toNamed(Routes.homeScreen, arguments: {'selectedIndex': 1})
              : Get.offAllNamed(
                  Routes.homeScreen,
                  arguments: {'selectedIndex': 3},
                );
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
