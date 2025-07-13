  import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget DisCouponWidget(BuildContext context) {
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyTextField(
              Radius: 10.0,
              textAlign: TextAlign.start,
              readOnly: false,
              obscureText: false,
              enabledBorderColor: context.colorsCustom.CardBorder,
              // controller: _LastNameTextController,
              keyboardType: TextInputType.name,
              hintText: context.enterTheCoupon,
              hintStyleColor: context.colorsCustom.TextSecondary,
              HintTextFontFamily: context.textStyles.bodySmall.regular,
              HintTextFontSize: 12.0.sp,
              prefixIcon: SvgPicture.asset(
                AppAssets.svgs.ticket_icon,
              ).paddingSymmetric(vertical: 10.h),
              fillColor: context.colorsCustom.surfacePrimaryWhite,
            ).box.width(290.w).height(54.h).make(),
            Container(
              width: 65.w,
              height: 54.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: context.colorsCustom.surfacePrimaryBlack,
              ),
              child: Center(
                child: Text(
                  context.implementation,
                  style: context.textStyles.bodySmall.bold.copyWith(
                    color: context.colorsCustom.ButtonLabelPrimary,
                  ),
                ),
              ),
            ).onTap(() {}),
          ],
        ),
      ],
    );
  }