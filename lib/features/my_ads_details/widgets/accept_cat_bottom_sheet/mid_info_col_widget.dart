import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/latest_announcements_widget.dart';

Widget MidInfoColWidget(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      LatestAnnouncementsRowWidget(
        context,
        text: context.transferDate,
        size: 12.sp,
        fontFamily: context.textStyles.bodySmall.medium.fontFamily,
        onPressed: () {
          print(context.reset);
        },
        Widget: Container(),
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppAssets.svgs.calendar_icon,
            width: 30.w,
            height: 30.w,
          ),
          horizontalSpace(5.w),
          Text(
            'الثلاثاء - 05/06/2025 01:01 م',
            textAlign: TextAlign.start,
            style: context.textStyles.bodySmall.medium.copyWith(
              color: context.colorsCustom.TextPrimary,
            ),
          ),
        ],
      ),
      verticalSpace(10.h),
      Text(
        context.presenter,
        textAlign: TextAlign.start,
        style: context.textStyles.bodyMedium.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),
      verticalSpace(10.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(backgroundImage: AssetImage(AppAssets.images.goku), radius: 30.w),
          horizontalSpace(5.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'مصعب شبات',
                textAlign: TextAlign.start,
                style: context.textStyles.bodySmall.medium.copyWith(
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
                    style: context.textStyles.headlineSmall.medium.copyWith(
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
      verticalSpace(20.h),
    ],
  );
}
