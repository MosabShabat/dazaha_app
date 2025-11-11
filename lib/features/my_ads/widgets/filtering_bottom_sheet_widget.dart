import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/widgets/latest_announcements_widget.dart';
import '../../../../core/widgets/top_con_bot_sh_widget.dart';
import '../../../../features/my_ads/widgets/filter_gride_view_widget.dart';

Future<dynamic> FilteringBottomSheetWidget(
  BuildContext context, {
  required String subTitle,
  required List<String> gridList,
  required RxInt selectedIndex,
  required Function(int) onTapSel,
  required VoidCallback onPress,
  required VoidCallback onTep,
}) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (_) => SingleChildScrollView(
      child: SafeArea(
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
                      fontFamily:
                          context.textStyles.bodyLarge.medium.fontFamily,
                      onPressed: onPress,
                      Widget: Text(
                        context.reset,
                        style: context.textStyles.headlineSmall.regular
                            .copyWith(
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
                    FilterGrideViewWidget(
                      context,
                      ListText: gridList,
                      selectedIndex: selectedIndex,
                      onTapSel: onTapSel,
                    ),
                    verticalSpace(Width * 0.15),
                    GeneralBottomAppWidget(
                      context,
                      text: context.filter,
                      onTap: onTep,
                    ),
                  ],
                ).box
                .color(context.colorsCustom.surfacePrimaryWhite)
                .padding(EdgeInsets.symmetric(horizontal: 20.w, vertical: 20))
                .width(Width)
                .make(),
      ),
    ),
  );
}
