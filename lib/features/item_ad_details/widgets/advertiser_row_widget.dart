 import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget AdvertiserRowWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.advertiser,
          textAlign: TextAlign.start,
          style: context.textStyles.bodyLarge.medium.copyWith(
            color: context.colorsCustom.TextPrimary,
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
                  radius: 30.w,
                ),
                horizontalSpace(10.w),
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
                    Text(
                      '2 إعلان |  80% تقييم إيجابي',
                      style: context.textStyles.bodySmall.regular.copyWith(
                        color: context.colorsCustom.TextSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            CircleAvatar(
                  backgroundColor: context.colorsCustom.surfacePrimaryWhite,
                  radius: 30.w,
                  child: Text(
                    '80%',
                    style: context.textStyles.bodyMedium.medium.copyWith(
                      color: context.colorsCustom.TextPrimary,
                    ),
                  ),
                ).box
                .customRounded(BorderRadiusGeometry.circular(50.r))
                .border(
                  color: context.colorsCustom.TealGreenSecondary,
                  width: 4.w,
                )
                .make(),
          ],
        ),
        verticalSpace(20.h),
      ],
    );
  }