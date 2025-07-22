import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dotted_decoration/dotted_decoration.dart';

Widget PicRepWidget(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${context.thePictures}',
            style: context.textStyles.bodyMedium.medium.copyWith(
              color: context.colorsCustom.TextPrimary,
            ),
          ),
          horizontalSpace(5.w),
          Text(
            '${context.optional}',
            style: context.textStyles.bodySmall.regular.copyWith(
              color: context.colorsCustom.TextSecondary,
            ),
          ),
        ],
      ),
      verticalSpace(10.h),
      Container(
        width: 100.w,
        height: 100.w,
        decoration: DottedDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: context.colorsCustom.CardBorder,
          shape: Shape.box,
        ),
        child: Center(child: SvgPicture.asset(AppAssets.svgs.gallery_add_icon)),
      ),
    ],
  );
}
