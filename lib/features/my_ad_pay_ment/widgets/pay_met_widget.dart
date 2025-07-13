import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/list_tale_circle_avatar_widget.dart';
import 'package:dazaha_app/features/my_ad_pay_ment/controller/my_ad_pay_ment_controller.dart';

Widget PayMetWidget(BuildContext context) {
  //MyAdPayMentController
  final MyAdPayMentController controller = Get.put(MyAdPayMentController());
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
      ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          var pay_meth_text = [
            context.applePay,
            context.zainCash,
            context.cardPayment,
          ];
          var pay_meth_icon = [
            AppAssets.svgs.apple_icon,
            AppAssets.svgs.zain_icon,
            AppAssets.svgs.credit_card_icon,
          ];
          return Obx(() {
            final isSelected = controller.selectedIndex.value == index;
            return Row(
                  children: [
                    SvgPicture.asset(
                      pay_meth_icon[index],
                      // color: context.colorsCustom.surfacePrimaryBlack,
                    ),
                    horizontalSpace(20.w),
                    Text(
                      pay_meth_text[index],
                      style: context.textStyles.bodySmall.bold.copyWith(
                        color: context.colorsCustom.TextPrimary,
                      ),
                    ),
                    Spacer(),
                    isSelected
                        ? IconCircleAvatarWidget(
                            backGroundColor:
                                context.colorsCustom.TealGreenSecondary,
                            sizeCircleAvatar: 12.w,
                            icon: Icons.done,
                            sizIcon: 15.w,
                            colorIcon: context.colorsCustom.surfacePrimaryWhite,
                          )
                        : Container(),
                  ],
                ).box
                .width(Width)
                .height(60.h)
                .padding(
                  EdgeInsetsGeometry.symmetric(horizontal: 16.w, vertical: 5.h),
                )
                .margin(EdgeInsetsGeometry.only(bottom: 20.h))
                .customRounded(BorderRadiusGeometry.circular(8.r))
                .border(
                  color: isSelected
                      ? context.colorsCustom.TealGreenSecondary
                      : context.colorsCustom.CardBorder,
                )
                .color(context.colorsCustom.surfacePrimaryWhite)
                .make()
                .onTap(() {
                  controller.changeSelect(index);
                });
          });
        },
      ),
    ],
  );
}
