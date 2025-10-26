import '../../../core/widgets/app_shimmers/custom_shimmer.dart';

import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../features/wallet/widgets/with_rec_row_bottom_widget.dart';
import '../controller/wallet_controller.dart';

Widget TopBoxWidget(
  BuildContext context, {
  required WalletController controller,
}) {
  return Container(
    width: 700.w,
    height: 343.h,
    decoration: BoxDecoration(
      color: context.colorsCustom.BluePrimary.withOpacity(0.15),
    ),
    child: Stack(
      children: [
        SvgPicture.asset(
          AppAssets.svgs.mask_group_sh_icon,
        ).box.alignTopLeft.make(),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.arrow_back_ios).onTap(() => Get.back()),
                verticalSpace(10.h),
                Text(
                  context.wallet,
                  style: context.textStyles.bodyLarge.bold.copyWith(
                    color: context.colorsCustom.TextPrimary,
                    fontSize: 20.sp,
                  ),
                ),
                verticalSpace(20.h),
                Text(
                  context.yourAvailableBalance,
                  style: context.textStyles.bodyMedium.medium.copyWith(
                    color: context.colorsCustom.TextPrimary,
                  ),
                ).box.alignCenter.make(),
                verticalSpace(15.h),
                Obx(() {
                  return controller.isLoading.isTrue
                      ? CustomShimmer(width: 100.w, height: 8.h)
                      : Text(
                          '${controller.walletModel!.value.wallet ?? ''}  ${controller.walletModel!.value.currency ?? ''}',
                          textAlign: TextAlign.center,
                          style: context.textStyles.headlineSmall.medium
                              .copyWith(
                                color: context.colorsCustom.BluePrimary,
                              ),
                        ).box.alignCenter.make();
                }),
                verticalSpace(60.h),
                WithRecRowBottomWidget(context, walletController: controller),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
