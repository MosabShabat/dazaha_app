import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../features/my_ads/widgets/search_text_field_widget.dart';
import '../../my_ads/widgets/filtering_bottom_sheet_widget.dart';
import '../controller/all_ads_controller.dart';

Widget SerRowWidget(
  BuildContext context, {
  required AllAdsController controller,
}) {
  return Row(
    children: [
      SearchTextFieldWidget(
        context,
        controller: controller.searchController,
        onSubmitted: (_) => controller.refreshOrders(),
      ).box.width(300.w).height(45.w).make(),
      horizontalSpace(10.w),
      Center(child: SvgPicture.asset(AppAssets.svgs.setting_4_icon)).box
          .width(45.w)
          .height(45.w)
          .customRounded(BorderRadiusGeometry.circular(8.r))
          .border(color: context.colorsCustom.CardBorder)
          .make()
          .onTap(() {
            FilteringBottomSheetWidget(
              context,
              gridList: [
                context.transportationAndDelivery,
                context.buyForMe,
                context.removeAndRecycle,
                context.dedication,
              ],
              subTitle: context.ViewYourRequestsByServiceType,
              selectedIndex: controller.selectedIndex,
              onTapSel: (index) => controller.changeSelect(index),
              onPress: () => controller.selectedIndex.value = 0,
              onTep: () {},
            );
          }),
    ],
  );
}
