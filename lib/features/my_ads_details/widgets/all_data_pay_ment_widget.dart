import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../features/my_ad_pay_ment/widgets/tot_det_row_widget.dart';
import '../../../core/network/models/orders/my_order_details.dart';

Widget AllDataPayMentWidget(BuildContext context, Payment payMentInfo) {
  return Column(
        children: [
          Text(
            'دِزهـــا',
            textAlign: TextAlign.start,
            style: context.textStyles.headlineSmall.medium.copyWith(
              color: context.colorsCustom.TealGreenSecondary,
            ),
          ).box.alignCenter.make(),
          verticalSpace(5.h),
          Text(
            '${payMentInfo.paidAt}',
            textAlign: TextAlign.start,
            style: context.textStyles.bodySmall.regular.copyWith(
              color: context.colorsCustom.TextSecondary,
            ),
          ).box.alignCenter.make(),
          verticalSpace(20.h),
          TotDetRowWidget(
            context,
            text1: context.invoiceNumber,
            text2: '${payMentInfo.billNo}',
            familyText1: context.textStyles.bodySmall.regular.fontFamily,
            familyText2: context.textStyles.bodySmall.regular.fontFamily,
            sizeText1: 12.sp,
            sizeText2: 12.sp,
            textColor1: context.colorsCustom.TextSecondary,
            textColor2: context.colorsCustom.TextSecondary,
          ),
          verticalSpace(10.h),
          Divider(color: context.colorsCustom.CardBorder, thickness: 1),
          Column(
            children: List.generate(payMentInfo.bill!.length, (index) {
              final dataPayMent = payMentInfo.bill![index];
              return Column(
                children: [
                  TotDetRowWidget(
                    context,
                    text1: '${dataPayMent.title}',
                    text2: '${dataPayMent.value}',
                    fontWeight1: index == payMentInfo.bill!.lastIndex
                        ? FontWeight.w700
                        : FontWeight.w400,
                    fontWeight2: index == payMentInfo.bill!.lastIndex
                        ? FontWeight.w700
                        : FontWeight.w400,
                    familyText1: index == payMentInfo.bill!.lastIndex
                        ? context.textStyles.bodySmall.bold.fontFamily
                        : context.textStyles.bodySmall.regular.fontFamily,
                    familyText2: index == payMentInfo.bill!.lastIndex
                        ? context.textStyles.bodySmall.bold.fontFamily
                        : context.textStyles.bodySmall.regular.fontFamily,
                    sizeText1: 12.sp,
                    sizeText2: 12.sp,
                    textColor1: context.colorsCustom.TextSecondary,
                    textColor2: context.colorsCustom.TextSecondary,
                  ),
                  verticalSpace(10.h),
                  index == 2
                      ? Divider(
                          color: context.colorsCustom.CardBorder,
                          thickness: 1,
                        )
                      : SizedBox(),
                ],
              );
            }),
          ),
        ],
      ).box
      .margin(
        EdgeInsetsGeometry.only(
          left: 20.w,
          right: 20.w,
          top: 40.h,
          bottom: 10.h,
        ),
      )
      .make();
}
