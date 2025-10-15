import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../features/my_ad_pay_ment/widgets/tot_det_row_widget.dart';
import '../controller/my_ad_pay_ment_controller.dart';

Widget FinalPayInfoWidget(BuildContext context, {required MyAdPayMentController controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(context.paymentSummary,
          style: context.textStyles.bodyMedium.medium.copyWith(color: context.colorsCustom.TextPrimary)),
      verticalSpace(15.h),
      Obx(() {
        final bills = controller.billList;
        if (bills.isEmpty) return const SizedBox.shrink();

        return Column(
          children: List.generate(bills.length, (index) {
            final item = bills[index];
            final isLast = index == bills.length - 1;
            return Padding(
              padding: EdgeInsets.only(bottom: 15.h),
              child: TotDetRowWidget(
                context,
                text1: item.title,
                text2: "${item.value} ${controller.currency.value}",
                familyText1: isLast ? context.textStyles.bodyMedium.medium.fontFamily : null,
                familyText2: isLast ? context.textStyles.bodyMedium.bold.fontFamily : null,
                sizeText2: isLast ? 16.sp : null,
                fontWeight1: isLast ? FontWeight.w700 : null,
                fontWeight2: isLast ? FontWeight.w700 : null,
              ),
            );
          }),
        );
      }),
    ],
  );
}
