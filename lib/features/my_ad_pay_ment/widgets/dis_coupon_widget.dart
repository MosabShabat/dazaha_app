import '../../../core/widgets/progress_view_white.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/theming/app_text_styles.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../../core/widgets/app_text_form_field.dart';
import '../../../features/my_ad_pay_ment/controller/my_ad_pay_ment_controller.dart';

Widget DisCouponWidget(
  BuildContext context, {
  required MyAdPayMentController controller,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        context.discountCoupon,
        style: context.textStyles.bodyMedium.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),
      verticalSpace(10.h),
      Row(
        children: [
          Container(
            width: Width * 0.68,
            height: 56.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: context.colorsCustom.CardBorder),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: SvgPicture.asset(
                    AppAssets.svgs.ticket_icon,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => AppTextFormField(
                      controller: controller.couponCodeController,
                      hasBorder: false,
                      enabled: controller.isDisabledCoupon.value,
                      contentPadding: EdgeInsets.zero,
                      keyboardType: TextInputType.text,
                      hintText: context.enterCouponHere,
                      validator: (value) {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          horizontalSpace(10.w),
          Obx(
            () => controller.isLoadingCoupon.isTrue
                ? Container(
                    width: 70.w,
                    height: 56.h,
                    decoration: BoxDecoration(
                      color: context.colorsCustom.surfacePrimaryBlack,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: ProgressViewWhite(context, true),
                  )
                : AppTextButton(
                    context,
                    buttonWidth: 80,
                    backgroundColor: context.colorsCustom.surfacePrimaryBlack,
                    buttonText: context.implementation,
                    textStyle: controller.isDisabledCoupon.isTrue
                        ? AppTextStyles.font14Primary500Medium(context)
                        : AppTextStyles.font14Grey500Medium(context),
                    onPressed: () {
                      if (controller.isDisabledCoupon.isTrue)
                        controller.validateInput(context);
                    },
                  ),
          ),
        ],
      ),
    ],
  );
}
