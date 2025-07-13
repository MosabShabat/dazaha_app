 import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/my_ad_pay_ment/widgets/tot_det_row_widget.dart';

Widget InvoiceBoxWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.invoice,
          textAlign: TextAlign.start,
          style: context.textStyles.bodyMedium.medium.copyWith(
            color: context.colorsCustom.TextSecondary,
          ),
        ),

        Stack(
          children: [
            SvgPicture.asset(
                  AppAssets.svgs.Big_con_icon,
                  height: 200.h,
                  fit: BoxFit.cover,
                ).box
                .width(Width.w)
                .height(400.h)
                // .color(Colors.pink)
                .withDecoration(
                  BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: context.colorsCustom.CardBorder.withOpacity(0.6),
                        blurRadius: 500,
                        // spreadRadius: 40,
                        offset: Offset(3, 6),
                      ),
                    ],
                  ),
                )
                .make(),
            Column(
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
                      'الثلاثاء 08/05/2025 04:30 م',
                      textAlign: TextAlign.start,
                      style: context.textStyles.bodySmall.regular.copyWith(
                        color: context.colorsCustom.TextSecondary,
                      ),
                    ).box.alignCenter.make(),
                    verticalSpace(20.h),
                    TotDetRowWidget(
                      context,
                      text1: context.invoiceNumber,
                      text2: '#37448587532',
                      familyText1:
                          context.textStyles.bodySmall.regular.fontFamily,
                      familyText2:
                          context.textStyles.bodySmall.regular.fontFamily,
                      sizeText1: 12.sp,
                      sizeText2: 12.sp,
                      textColor1: context.colorsCustom.TextSecondary,
                      textColor2: context.colorsCustom.TextSecondary,
                    ),
                    verticalSpace(10.h),
                    Divider(
                      color: context.colorsCustom.CardBorder,
                      thickness: 1,
                    ),
                    verticalSpace(10.h),
                    TotDetRowWidget(
                      context,
                      text1: context.serviceAmount,
                      text2: '10,020 د.ع',
                      familyText1:
                          context.textStyles.bodySmall.regular.fontFamily,
                      familyText2:
                          context.textStyles.bodySmall.regular.fontFamily,
                      sizeText1: 12.sp,
                      sizeText2: 12.sp,
                    ),
                    verticalSpace(20.h),
                    TotDetRowWidget(
                      context,
                      text1: context.discountCoupon,
                      text2: '500 - د.ع',
                      familyText1:
                          context.textStyles.bodySmall.regular.fontFamily,
                      familyText2:
                          context.textStyles.bodySmall.regular.fontFamily,
                      sizeText1: 12.sp,
                      sizeText2: 12.sp,
                    ),
                    verticalSpace(20.h),
                    TotDetRowWidget(
                      context,
                      text1: context.invoiceNumber,
                      text2: '9,520 د.ع',
                      familyText1:
                          context.textStyles.bodySmall.regular.fontFamily,
                      familyText2:
                          context.textStyles.bodySmall.regular.fontFamily,
                      sizeText1: 12.sp,
                      sizeText2: 12.sp,
                    ),
                    verticalSpace(10.h),
                    Divider(
                      color: context.colorsCustom.CardBorder,
                      thickness: 1,
                    ),
                    verticalSpace(20.h),
                    TotDetRowWidget(
                      context,
                      text1: context.valueAddedTax,
                      text2: '1,142 د.ع',
                      familyText1:
                          context.textStyles.bodySmall.regular.fontFamily,
                      familyText2:
                          context.textStyles.bodySmall.regular.fontFamily,
                      sizeText1: 12.sp,
                      sizeText2: 12.sp,
                    ),
                    verticalSpace(20.h),
                    TotDetRowWidget(
                      context,
                      text1: context.totalAmount,
                      text2: '9,520 د.ع',
                      familyText1:
                          context.textStyles.bodyMedium.bold.fontFamily,
                      familyText2:
                          context.textStyles.bodyMedium.bold.fontFamily,
                      sizeText1: 12.sp,
                      sizeText2: 12.sp,
                      fontWeight1: FontWeight.w700,
                      fontWeight2: FontWeight.w700,
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
                .make(),
          ],
        ),
        verticalSpace(20.h),
      ],
    );
  }