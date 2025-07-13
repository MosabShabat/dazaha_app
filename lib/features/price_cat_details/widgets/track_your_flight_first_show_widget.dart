import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:lottie/lottie.dart';

Widget TrackYourFlightFirstShowWidget(BuildContext context) {
  return Container(
    width: Width.w,
    height: 130.h,
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
    decoration: BoxDecoration(
      color: context.colorsCustom.LightTealGreen,
      borderRadius: BorderRadius.circular(4.r),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${context.trackTheFlight}',
              style: context.textStyles.headlineSmall.medium.copyWith(
                color: context.colorsCustom.TextPrimary,
                fontSize: 18.sp,
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.directSupportMapScreen);
              },
              child: Container(
                width: 110.w,
                height: 35.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: context.colorsCustom.surfacePrimaryBlack,
                ),
                child: Center(
                  child: Text(
                    context.tracking,
                    style: context.textStyles.bodySmall.bold.copyWith(
                      color: context.colorsCustom.ButtonLabelPrimary,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(), // Placeholder for spacing or future use
          ],
        ),
        Container(
          width: 120.w,
          height: 120.w,
          child: Lottie.asset(
            AppAssets.json.delivery_track_order_json,
            fit: BoxFit.fill,
          ),
        ),
      ],
    ),
  );
}
