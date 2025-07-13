import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/list_tale_circle_avatar_widget.dart';
import 'package:dazaha_app/features/pick_up_method_upon_delivery/controller/pick_up_method_upon_delivery_controller.dart';
import 'package:flutter/cupertino.dart';

Widget SwitchRowWidget({
  required BuildContext context,
  // required bool switchValue,
  // required ValueChanged<bool> onChanged,
}) {
  final PickUpMethodUponDeliveryController controller = Get.put(
    PickUpMethodUponDeliveryController(),
  );
  return Obx(() {
    final _switchValue = controller.switchValue.value;

    return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTaleCircleAvatarWidget(
              backGroundColor: context.colorsCustom.CardBackgroundLightGray,
              img: AppAssets.svgs.box_del_icon,
              sizImg: 25.w,
              sizeCircleAvatar: 25.w,
            ),
            horizontalSpace(10.w),
            Text(
              textAlign: TextAlign.start,
              maxLines: 2,
              context.carryingAssistanceAvailableUponReceipt,
              style: context.textStyles.bodySmall.medium.copyWith(
                color: context.colorsCustom.TextPrimary,
              ),
            ).box.width(220.w).height(30.w).make(),
            // 10.widthBox,
            Spacer(),
            CupertinoSwitch(
              value: _switchValue,
              activeTrackColor: context.colorsCustom.TealGreenSecondary,
              onChanged: (value) {
                controller.toggleSwitch();
              },
            ).box.height(25.h).width(40.w).make(),
          ],
        ).box
        .color(context.colorsCustom.surfacePrimaryWhite)
        .rounded
        .margin(EdgeInsetsGeometry.only(bottom: 10.h))
        .padding(EdgeInsetsGeometry.symmetric(horizontal: 10.w, vertical: 8.h))
        .withDecoration(
          BoxDecoration(
            color: context.colorsCustom.surfacePrimaryWhite,
            borderRadius: BorderRadius.circular(12).w,
            boxShadow: [
              BoxShadow(
                color: context.colorsCustom.CardBorder.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 4),
              ),
            ],
          ),
        )
        .make();
  });
}
