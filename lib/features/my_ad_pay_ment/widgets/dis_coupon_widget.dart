import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/home_page/widgets/cus_button_widget.dart';

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
          SizedBox(
            width: 290.w,
            height: 54.h,
            child: MyTextField(
              Radius: 10.0,
              textAlign: TextAlign.start,
              readOnly: false,
              obscureText: false,
              enabledBorderColor: context.colorsCustom.CardBorder,
              keyboardType: TextInputType.name,
              hintText: context.enterTheCoupon,
              hintStyleColor: context.colorsCustom.TextSecondary,
              HintTextFontFamily:
                  context.textStyles.bodySmall.regular.fontFamily,
              HintTextFontSize: 12.0.sp,
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: SvgPicture.asset(AppAssets.svgs.ticket_icon),
              ),
              fillColor: context.colorsCustom.surfacePrimaryWhite,
            ),
          ),
          CusButtonWidget(
            context,
            H: 54.0.h,
            W: 65.0.w,
            backGroundColor: context.colorsCustom.surfacePrimaryBlack,
            radius: 8.0.r,
            widget: Text(
              context.implementation,
              style: context.textStyles.bodySmall.bold.copyWith(
                color: context.colorsCustom.ButtonLabelPrimary,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
