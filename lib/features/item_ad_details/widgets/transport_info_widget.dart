import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../choose_the_service/controller/order_data_controller.dart';

Widget TransportInfoWidget(
  BuildContext context, {
  required title,
  required serviceName,
  required description,
}) {
  OrderDataController orderDataController = Get.find();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: context.textStyles.titleMedium.bold.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),
      verticalSpace(10.h),
      orderDataController.serviceUuid == '153a7042-eb9e-42b8-9d5c-498623adb5da'
          ? SizedBox.shrink()
          : Text(
              serviceName,
              style: context.textStyles.labelMedium.medium.copyWith(
                color: context.colorsCustom.TextSecondary,
              ),
            ),
      verticalSpace(10.h),
      Text(
        description,
        maxLines: 60,
        style: context.textStyles.labelMedium.medium.copyWith(
          color: context.colorsCustom.TextSecondary,
        ),
      ),
    ],
  );
}
