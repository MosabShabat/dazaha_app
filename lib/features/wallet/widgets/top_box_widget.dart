import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/wallet/widgets/with_rec_row_bottom_widget.dart';

Widget TopBoxWidget(BuildContext context) {
  return Container(
    width: Width.w,
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
                Text(
                  '10,020 د.ع',
                  style: context.textStyles.headlineSmall.medium.copyWith(
                    color: context.colorsCustom.BluePrimary,
                  ),
                ).box.alignCenter.make(),
                verticalSpace(60.h),
                WithRecRowBottomWidget(context),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
