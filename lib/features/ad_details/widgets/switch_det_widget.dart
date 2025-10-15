import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../features/ad_details/controller/ad_details_controller.dart';
import '../../../features/ad_details/widgets/list_view_ad_details_helpers_widget.dart';
import 'package:flutter/cupertino.dart';

import '../../choose_the_service/controller/order_data_controller.dart';

Widget SwitchDetWidget(
  BuildContext context, {
  required isShow,
  required OrderDataController orderDataController,
}) {
  final AdDetailsController controller = Get.put(AdDetailsController());
  //AdDetailsController
  return Obx(() {
    final _switchValue = controller.switchValue.value;

    return isShow
        ? Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.doYouNeedHelpers,
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    style: context.textStyles.titleSmall.medium.copyWith(
                      color: context.colorsCustom.TextPrimary,
                    ),
                  ),
                  CupertinoSwitch(
                    value: _switchValue,
                    activeTrackColor: context.colorsCustom.TealGreenSecondary,
                    onChanged: (value) {
                      controller.toggleSwitch();
                      if (controller.switchValue.value == false) {
                        orderDataController.setHelpers('0');
                      }
                    },
                  ).box.height(25.h).width(40.w).make(),
                ],
              ),
              verticalSpace(20.h),
              _switchValue
                  ? ListViewAdDetailsHelpersWidget(
                      context: context,
                      orderDataController: orderDataController,
                    )
                  : Container(),
            ],
          )
        : Container();
  });
}
