import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/widgets/latest_announcements_widget.dart';
import '../../../../core/widgets/top_con_bot_sh_widget.dart';
import '../../../../features/my_ads/widgets/filter_gride_view_widget.dart';

Future<dynamic> FilteringBottomSheetWidget(
  BuildContext context, {
  required String subTitle,
  required List<String> gridList,
  required dynamic gridController,
  required dynamic orderDataController,
}) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (_) => SingleChildScrollView(
      child:
          Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopConBotShWidget(context).box.alignCenter.make(),
                  verticalSpace(10.h),
                  LatestAnnouncementsRowWidget(
                    context,
                    text: context.filter,
                    size: 16.sp,
                    fontFamily: context.textStyles.bodyLarge.medium.fontFamily,
                    onPressed: () => gridController.selectedIndex.value = 0,
                    Widget: Text(
                      context.reset,
                      style: context.textStyles.headlineSmall.regular.copyWith(
                        color: context.colorsCustom.TextSecondary,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  Text(
                    subTitle,
                    style: context.textStyles.headlineSmall.regular.copyWith(
                      color: context.colorsCustom.TextSecondary,
                      fontSize: 14.sp,
                    ),
                  ),
                  verticalSpace(35.h),
                  FilterGrideViewWidget(context, ListText: gridList),
                  verticalSpace(Width * 0.15),
                  GeneralBottomAppWidget(
                    context,
                    text: context.filter,
                    onTap: () {
                      final uuid = switch (gridController.selectedIndex.value) {
                        0 => '69fb5c27-11ef-4637-986f-ed484b388c7f',
                        1 => '9cc543c0-793c-43d9-88a6-6e3db6082ef5',
                        2 => '7f625412-ca00-431d-a7fd-12863fc851ef',
                        _ => '153a7042-eb9e-42b8-9d5c-498623adb5da',
                      };
                      orderDataController.setServiceUuid(uuid);
                      gridController.refreshOrders();
                      Navigator.pop(context);
                    },
                  ),
                ],
              ).box
              .color(context.colorsCustom.surfacePrimaryWhite)
              .padding(EdgeInsets.symmetric(horizontal: 20.w, vertical: 20))
              .width(Width)
              .make(),
    ),
  );
}
