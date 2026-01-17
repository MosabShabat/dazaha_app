import '../../../core/constant/exports_libraries.dart';
// import '../../../core/constant/exports_widgets.dart';
import '../../../features/my_ads/widgets/search_text_field_widget.dart';
// import '../../my_ads/widgets/filtering_bottom_sheet_widget.dart';
import '../controller/all_ads_controller.dart';

Widget SerRowWidget(
  BuildContext context, {
  required AllAdsController controller,
}) {
  return Row(
    children: [
      Expanded(
        child: SizedBox(
          height: 45.w,
          child: SearchTextFieldWidget(
            context,
            controller: controller.searchController,
            onChanged: (value) => controller.searchText.value = value,
            onSubmitted: (_) => controller.refreshOrders(),
          ),
        ),
      ),
    ],
  ).paddingSymmetric(horizontal: 4.w);
}