import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/ad_details/controller/ad_details_controller.dart';
import 'package:dazaha_app/features/ad_details/widgets/list_view_ad_details_helpers_widget.dart';
import 'package:flutter/cupertino.dart';

Widget SwitchDetWidget(BuildContext context, {required isShow}) {
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
                    },
                  ).box.height(25.h).width(40.w).make(),
                ],
              ),
              verticalSpace(20.h),
              _switchValue
                  ? ListViewAdDetailsHelpersWidget(context: context)
                  : Container(),
            ],
          )
        : Container();
  });
}
