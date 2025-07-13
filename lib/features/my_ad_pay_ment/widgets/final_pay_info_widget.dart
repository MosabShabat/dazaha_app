import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/my_ad_pay_ment/widgets/tot_det_row_widget.dart';

Widget FinalPayInfoWidget(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        context.paymentSummary,
        style: context.textStyles.bodyMedium.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),
      verticalSpace(15.h),
      TotDetRowWidget(context, text1: context.subtotal, text2: '12,000 د.ع'),
      verticalSpace(15.h),
      TotDetRowWidget(
        context,
        text1: context.discountCoupon,
        text2: '12,000 د.ع',
      ),
      verticalSpace(15.h),
      TotDetRowWidget(
        context,
        text1: context.valueAddedTax,
        text2: '12,000 د.ع',
      ),
      verticalSpace(15.h),
      TotDetRowWidget(
        context,
        text1: context.totalAmount,
        text2: '12,000 د.ع',
        familyText1: context.textStyles.bodyMedium.medium.fontFamily,
        familyText2: context.textStyles.bodyMedium.bold.fontFamily,
        sizeText2: 16.sp,
        fontWeight1: FontWeight.w700,
        fontWeight2: FontWeight.w700
      ),
    ],
  );
}
