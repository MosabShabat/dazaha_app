import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/list_tale_circle_avatar_widget.dart';
import 'package:dazaha_app/features/choose_the_service/widgets/text_service_widget.dart';
import 'package:dazaha_app/features/pick_up_method_upon_delivery/controller/pick_up_method_upon_delivery_controller.dart';

Widget ListViewPickUpMethodUpOnDeliveryWidget({required BuildContext context}) {
  var ListTextTitlePickUpMethodUpOnDelivery = [
    context.homeDoor,
    context.stairs,
    context.garden,
    context.iWillMeetAndShowYouThePlace,
  ];
  var ListTextSubTitlePickUpMethodUpOnDelivery = [
    '',
    context.movingItemsRequiresClimbingStairs,
    '',
    '',
  ];
  final PickUpMethodUponDeliveryController controller = Get.put(
    PickUpMethodUponDeliveryController(),
  );
  return ListView.builder(
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    itemCount: 4,
    itemBuilder: (context, index) {
      return Obx(() {
        final isSelected = controller.selectedIndex.value == index;
        return GestureDetector(
          onTap: () {
            controller.changeSelect(index);
            print(index);
          },
          child:
              Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ListTaleCircleAvatarWidget(
                        backGroundColor:
                            context.colorsCustom.CardBackgroundLightGray,
                        img: ListImagesPickUpMethodUpOnDelivery[index],
                        sizImg: 25.w,
                        sizeCircleAvatar: 25.w,
                      ),
                      horizontalSpace(10.w),
                      TextServiceWidget(
                        context,
                        color1: context.colorsCustom.TextPrimary,
                        text1: ListTextTitlePickUpMethodUpOnDelivery[index],
                        size1: 14.0.sp,
                        fontFamily1:
                            context.textStyles.bodyMedium.medium.fontFamily,
                        color2: context.colorsCustom.TextSecondary,
                        text2: ListTextSubTitlePickUpMethodUpOnDelivery[index],
                        size2: 12.0.sp,
                        fontFamily2:
                            context.textStyles.bodySmall.regular.fontFamily,
                      ),
                      Spacer(),
                      isSelected
                          ? IconCircleAvatarWidget(
                              backGroundColor:
                                  context.colorsCustom.TealGreenSecondary,
                              sizIcon: 15.w,
                              icon: Icons.done,
                              sizeCircleAvatar: 10.w,
                              colorIcon:
                                  context.colorsCustom.surfacePrimaryWhite,
                            )
                          : Container(),
                    ],
                  ).box
                  .color(context.colorsCustom.surfacePrimaryWhite)
                  .rounded
                  .margin(EdgeInsetsGeometry.only(bottom: 10.h))
                  .padding(
                    EdgeInsetsGeometry.symmetric(
                      horizontal: 10.w,
                      vertical: 8.h,
                    ),
                  )
                  .withDecoration(
                    BoxDecoration(
                      color: context.colorsCustom.surfacePrimaryWhite,
                      borderRadius: BorderRadius.circular(12).w,
                      boxShadow: [
                        BoxShadow(
                          color: context.colorsCustom.CardBorder.withOpacity(
                            0.2,
                          ),
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                  )
                  .make(),
        );
      });
    },
  ).box.width(Width).make();
}
