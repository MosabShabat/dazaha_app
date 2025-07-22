import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget stackAdsText(BuildContext context) {
  return Container(
    width: Width.w,
    // height: Width * 0.35,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
    child: Stack(
      children: [
        Positioned.fill(
          child: SvgPicture.asset(
            AppAssets.svgs.cover,
            fit: BoxFit.fill,
            height: 60.h,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(20.h),
              Text(
                context.startYourJourneyNow,
                textAlign: TextAlign.start,
                maxLines: 1,
                style: context.textStyles.titleLarge.medium.copyWith(
                  color: context.colorsCustom.surfacePrimaryWhite,
                  fontSize: 20.0.sp,
                ),
              ),
              verticalSpace(10.h),
              Text(
                context.enterPickupAndDropOffLocationDetailsToProceed,
                textAlign: TextAlign.start,
                maxLines: 1,
                style: context.textStyles.titleSmall.regular.copyWith(
                  color: context.colorsCustom.surfacePrimaryWhite,
                  fontSize: 14.0.sp,
                ),
              ),
              verticalSpace(20.h),
            ],
          ),
        ),
      ],
    ),
  );
}
