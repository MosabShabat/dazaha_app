import '../../../core/constant/exports_libraries.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/helpers/theme_exports.dart';

Widget TimeColumnWidget(
  BuildContext context, {
  required String img,
  required String imgText,
  required int timeLen,
  required List timeItem,
}) {
  final textStyleLabel = context.textStyles.labelMedium.medium.copyWith(
    color: context.colorsCustom.TextPrimary,
  );
  final textStyleTitle = context.textStyles.labelMedium.medium.copyWith(
    color: context.colorsCustom.TextSecondary,
  );

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          SvgPicture.asset(img, color: context.colorsCustom.TextSecondary),
          5.widthBox,
          Text(imgText, style: textStyleTitle, maxLines: 1),
        ],
      ),
      verticalSpace(10.h),
      SizedBox(
        height: Width * 0.1,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: timeLen,
          itemBuilder: (_, index) {
            final time = timeItem[index].time ?? '';
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                color: context.colorsCustom.CardBackgroundLightGray,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(time, style: textStyleLabel, maxLines: 1),
            );
          },
        ),
      ),
    ],
  );
}
