import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/home_page/widgets/cus_button_widget.dart';

Widget TopContainerWidget(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
    child: Container(
      height: 140.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: context.colorsCustom.LightOrange,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              context.goArriveEarn,
              style: context.textStyles.bodyLarge.bold.copyWith(
                color: context.colorsCustom.TextPrimary,
              ),
            ),
            Text(
              context.placeOrdersAnd,
              style: context.textStyles.bodySmall.regular.copyWith(
                color: context.colorsCustom.TextSecondary,
              ),
            ),
            Container(
              width: 360.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CusButtonWidget(
                    context,
                    H: 34.0.h,
                    W: 104.0.w,
                    // isText: true,
                    backGroundColor: context.colorsCustom.surfacePrimaryBlack,
                    radius: 8.0.r,
                    widget: Text(
                      context.joinNow,
                      style: context.textStyles.bodySmall.medium.copyWith(
                        color: context.colorsCustom.ButtonLabelPrimary,
                      ),
                    ),
                  ),
                  SvgPicture.asset(AppAssets.svgs.envato_labs_image_edit_icon),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
