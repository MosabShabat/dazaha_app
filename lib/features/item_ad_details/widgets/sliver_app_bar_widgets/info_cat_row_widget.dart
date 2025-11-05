import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../choose_the_service/controller/order_data_controller.dart';
import 'sle_col_text_widget.dart';

Widget InfoCatRowWidget(
  BuildContext context, {
  required price,
  required distance,
}) {
  final OrderDataController orderDataController = Get.find();

  return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          orderDataController.serviceUuid ==
                  '153a7042-eb9e-42b8-9d5c-498623adb5da'
              ? SizedBox.shrink()
              : SleColTextWidget(
                  context,
                  title: context.askingPrice,
                  subTitle: price,
                ),
          SleColTextWidget(
            context,
            title: context.distance,
            subTitle: '${distance} ${context.km}',
          ),
        ],
      ).box.alignBottomCenter
      .padding(EdgeInsetsGeometry.symmetric(horizontal: 16.w, vertical: 10.h))
      .make();
}
