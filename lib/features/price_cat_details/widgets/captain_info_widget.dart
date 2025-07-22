import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget CaptainInfoWidget(BuildContext context,) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        context.flightCaptain,
        textAlign: TextAlign.start,
        style: context.textStyles.bodyMedium.medium.copyWith(
          color: context.colorsCustom.TextSecondary,
        ),
      ),
      verticalSpace(10.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(AppAssets.images.goku),
                radius: 35.w,
              ),
              horizontalSpace(5.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'مصعب شبات',
                    textAlign: TextAlign.start,
                    style: context.textStyles.bodyMedium.medium.copyWith(
                      color: context.colorsCustom.TextPrimary,
                    ),
                  ),
                  verticalSpace(10.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(AppAssets.svgs.star_bold_icon),
                      horizontalSpace(5.w),
                      Text(
                        '5.0',
                        style: context.textStyles.headlineSmall.regular
                            .copyWith(
                              color: context.colorsCustom.TextPrimary,
                              fontSize: 12.sp,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          CircleAvatar(
            backgroundColor: context.colorsCustom.TealGreenSecondary,
            radius: 20.w,
            child: SvgPicture.asset(
              AppAssets.svgs.message_icon,
              color: context.colorsCustom.surfacePrimaryWhite,
            ),
          ).onTap(() {
            Get.toNamed(Routes.directSupportScreen);
          }),
        ],
      ),
    ],
  );
}
