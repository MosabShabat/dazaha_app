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
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
                  ],
                ),
              ),
            ),
            SvgPicture.asset(
              AppAssets.svgs.mask_group_sh_icon,
            ).box.alignTopLeft.make(),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.yourAvailableBalance,
              style: context.textStyles.bodyMedium.medium.copyWith(
                color: context.colorsCustom.TextPrimary,
              ),
            ).box.alignCenter.make(),
            verticalSpace(5.h),
            Obx(() {
              return controller.isLoading.isTrue
                  ? WalletShimmerWidget()
                  : Text(
                      '${controller.walletModel!.value.wallet ?? ''}  ${controller.walletModel!.value.currency ?? ''}',
                      textAlign: TextAlign.center,
                      style: context.textStyles.headlineSmall.bold.copyWith(
                        color: context.colorsCustom.BluePrimary,
                        fontSize: 24.sp,
                      ),
                    ).box.alignCenter.height(40.h).make();
            }),
            verticalSpace(5.h),
            WithRecRowBottomWidget(context, walletController: controller),
          ],
        ),
      ],
    ),
  );
}

class WalletShimmerWidget extends StatelessWidget {
  const WalletShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [CustomShimmer(width: 100.w, height: 40.h, borderRadius: 24.r)],
    ).box.height(40.h).make();
  }
}
