import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../features/home_page/widgets/cus_button_widget.dart';

Widget TopContainerWidget(BuildContext context) {
  final bgColor = context.colorsCustom.LightOrange;
  final buttonColor = context.colorsCustom.surfacePrimaryBlack;

  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
    child: InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: () => Get.toNamed(Routes.captainJoinsScreen),
      child: Container(
        height: 150.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CusButtonWidget(
                  context,
                  H: 34.h,
                  W: 104.w,
                  backGroundColor: buttonColor,
                  radius: 8.r,
                  widget: Text(
                    context.joinNow,
                    style: context.textStyles.bodySmall.medium.copyWith(
                      color: context.colorsCustom.ButtonLabelPrimary,
                    ),
                  ),
                ),
                Image.asset(AppAssets.images.envato_img),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
