import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../features/choose_the_service/controller/order_data_controller.dart';
import '../controller/my_ad_pay_ment_controller.dart';
import '../../../core/widgets/custom_cached_image.dart';
import '../../../core/widgets/list_tale_circle_avatar_widget.dart';

Widget PayMetWidget(
  BuildContext context, {
  required MyAdPayMentController controller,
}) {
  final model = controller.orderPaymentModel;
  if (model == null || model.paymentWays.isEmpty)
    return const SizedBox.shrink();

  final orderDataController = Get.find<OrderDataController>();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        context.paymentMethod,
        style: context.textStyles.bodyMedium.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),
      verticalSpace(15.h),
      Column(
        children: List.generate(model.paymentWays.length, (index) {
          final payDet = model.paymentWays[index];
          return Obx(() {
            final isSelected = controller.selectedIndex.value == index;
            return Row(
                  children: [
                    CustomCachedImage(
                      imageUrl: payDet.image,
                      width: 40.w,
                      height: 24.h,
                    ),
                    horizontalSpace(10.w),
                    Expanded(
                      child: Text(
                        payDet.name,
                        style: context.textStyles.bodySmall.bold.copyWith(
                          color: context.colorsCustom.TextPrimary,
                        ),
                      ),
                    ),
                    if (isSelected)
                      IconCircleAvatarWidget(
                        backGroundColor:
                            context.colorsCustom.TealGreenSecondary,
                        sizeCircleAvatar: 12.w,
                        icon: Icons.done,
                        sizIcon: 15.w,
                        colorIcon: context.colorsCustom.surfacePrimaryWhite,
                      ),
                  ],
                ).box
                .width(Width)
                .height(60.h)
                .padding(EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h))
                .margin(EdgeInsets.only(bottom: 20.h))
                .customRounded(BorderRadius.circular(8.r))
                .border(
                  color: isSelected
                      ? context.colorsCustom.TealGreenSecondary
                      : context.colorsCustom.CardBorder,
                )
                .color(context.colorsCustom.surfacePrimaryWhite)
                .make()
                .onTap(() {
                  controller.changeSelect(index);
                  orderDataController.setData(payDet.uuid);
                });
          });
        }),
      ),
    ],
  );
}
