import '../../../core/constant/exports_widgets.dart';

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
      SearchTextFieldWidget(
        context,
        controller: controller.searchController,
        onChanged: (value) => controller.searchText.value = value,
        onSubmitted: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      ).box.width(Width.w - 52.w).height(45.w).make(),
    ],
  );
}
