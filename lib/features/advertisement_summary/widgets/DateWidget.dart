import '../../../core/constant/exports_widgets.dart';
import '../../../core/constant/exports_libraries.dart';

Widget DateWidget(BuildContext context, String date) {
  final textStyleLabel = context.textStyles.labelMedium.medium;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          SvgPicture.asset(
            AppAssets.svgs.calendar_icon,
            color: context.colorsCustom.TextSecondary,
          ),
          5.widthBox,
          Text(
            context.date,
            style: textStyleLabel.copyWith(
              color: context.colorsCustom.TextSecondary,
            ),
          ),
        ],
      ),
      verticalSpace(10.h),
      Container(
        width: 100.w,
        height: 40.h,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        decoration: BoxDecoration(
          color: context.colorsCustom.CardBackgroundLightGray,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          date,
          style: textStyleLabel.copyWith(
            color: context.colorsCustom.TextPrimary,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
      ),
    ],
  );
}
