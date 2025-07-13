import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget PayMthWidget(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        context.paymentMethod,
        textAlign: TextAlign.start,
        style: context.textStyles.bodyMedium.medium.copyWith(
          color: context.colorsCustom.TextSecondary,
        ),
      ),
      verticalSpace(10.h),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              SvgPicture.asset(AppAssets.svgs.cre_card_icon),
              horizontalSpace(5.w),
              Text(
                context.cardPayment,
                textAlign: TextAlign.start,
                style: context.textStyles.bodyMedium.medium.copyWith(
                  color: context.colorsCustom.TextSecondary,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          Text(
            'XXXX XXXX XXX 3321',
            textAlign: TextAlign.start,
            style: context.textStyles.bodySmall.regular.copyWith(
              color: context.colorsCustom.TextPrimary,
            ),
          ),
        ],
      ),
    ],
  );
}
