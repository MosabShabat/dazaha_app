import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../features/ad_details/widgets/list_view_ad_details_widget.dart';
import '../../choose_the_service/controller/order_data_controller.dart';

Widget MiddleCustomWidget(
  BuildContext context, {
  required OrderDataController orderDataController,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        context.whatAreTheSizesOfTheItems,
        style: context.textStyles.bodyMedium.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),
      verticalSpace(5.h),
      ListViewAdDetailsWidget(
        context: context,
        orderDataController: orderDataController,
      ),
      verticalSpace(20.h),
    ],
  );
}
