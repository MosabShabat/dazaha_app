
import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/widgets/list_tale_circle_avatar_widget.dart';
import '../../../features/choose_the_service/widgets/text_service_widget.dart';
import '../../../features/pick_up_method_upon_delivery/controller/pick_up_method_upon_delivery_controller.dart';
import '../../../core/widgets/app_shimmers/custom_shimmer.dart';
import '../../choose_the_service/controller/order_data_controller.dart';

Widget ListViewPickUpMethodUpOnDeliveryWidget({
  required BuildContext context,
  required OrderDataController orderDataController,
}) {
  final _pickUpCtrl = Get.find<PickUpMethodUponDeliveryController>();

  return Obx(() {
    if (_pickUpCtrl.isDataLoading.isTrue) {
      return CustomShimmer(width: Width.w, height: 300.h, borderRadius: 12.r);
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _pickUpCtrl.receiptMethods.length,
      itemBuilder: (context, index) {
        final method = _pickUpCtrl.receiptMethods[index];
        return Obx(() {
          final isSelected = _pickUpCtrl.selectedIndex.value == index;

          return GestureDetector(
            onTap: () {
              _pickUpCtrl.changeSelect(index);
              orderDataController.setReceiptMethodUuid(method.uuid ?? '');
            },
            child: Container(
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
                  ListTaleCircleAvatarWidget(
                    backGroundColor:
                        context.colorsCustom.CardBackgroundLightGray,
                    img: method.image ?? '',
                    sizImg: 25.w,
                    sizeCircleAvatar: 25.w,
                  ),
                  horizontalSpace(10.w),
                  Expanded(
                    child: TextServiceWidget(
                      context,
                      color1: context.colorsCustom.TextPrimary,
                      text1: method.title ?? '',
                      size1: 14.sp,
                      fontFamily1:
                          context.textStyles.bodyMedium.medium.fontFamily!,
                      color2: context.colorsCustom.TextSecondary,
                      text2: method.description ?? '',
                      size2: 12.sp,
                      fontFamily2:
                          context.textStyles.bodySmall.regular.fontFamily,
                    ),
                  ),
                  if (isSelected)
                    IconCircleAvatarWidget(
                      backGroundColor: context.colorsCustom.TealGreenSecondary,
                      sizIcon: 15.w,
                      icon: Icons.done,
                      sizeCircleAvatar: 10.w,
                      colorIcon: context.colorsCustom.surfacePrimaryWhite,
                    ),
                ],
              ),
            ),
          );
        });
      },
    ).box.width(Width).make();
  });
}
