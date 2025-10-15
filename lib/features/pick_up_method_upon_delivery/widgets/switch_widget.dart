import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../features/pick_up_method_upon_delivery/widgets/switch_row_widget.dart';

import '../../choose_the_service/controller/order_data_controller.dart';

Widget SwitchWidget(
  BuildContext context, {
  required OrderDataController orderDataController,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        context.extra,
        textAlign: TextAlign.start,
        maxLines: 1,
        style: context.textStyles.bodyLarge.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),
      verticalSpace(20.h),
      SwitchRowWidget(
        context: context,
        orderDataController: orderDataController,
      ),
    ],
  );
}
