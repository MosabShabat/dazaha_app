import 'package:flutter/cupertino.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../features/pick_up_method_upon_delivery/controller/pick_up_method_upon_delivery_controller.dart';
import '../../choose_the_service/controller/order_data_controller.dart';

Widget SwitchRowWidget({
  required BuildContext context,
  required OrderDataController orderDataController,
}) {
  final controller = Get.put(PickUpMethodUponDeliveryController());

  return Obx(() {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: context.colorsCustom.surfacePrimaryWhite,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: context.colorsCustom.CardBorder.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: context.colorsCustom.CardBackgroundLightGray,
            maxRadius: 25.w,
            child: SvgPicture.asset(
              AppAssets.svgs.box_del_icon,
              width: 25.w,
              height: 25.w,
            ),
          ),
          horizontalSpace(10.w),
          Expanded(
            child: Text(
              context.carryingAssistanceAvailableUponReceipt,
              maxLines: 2,
              style: context.textStyles.bodySmall.medium.copyWith(
                color: context.colorsCustom.TextPrimary,
              ),
            ),
          ),
          CupertinoSwitch(
            value: controller.switchValue.value,
            activeTrackColor: context.colorsCustom.TealGreenSecondary,
            onChanged: (value) {
              controller.toggleSwitch();
              orderDataController.setCanHelp(value ? '1' : '0');
            },
          ),
        ],
      ),
    );
  });
}
