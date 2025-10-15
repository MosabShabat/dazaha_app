import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';

Widget ShadowConWidget(
  BuildContext context, {
  required title,
  required imageUrl,
  required price,
}) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      width: 170.w,
      height: 80.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            context.colorsCustom.surfacePrimaryBlack.withOpacity(
              0.9,
            ), // Bottom: semi-black
            context.colorsCustom.surfacePrimaryBlack.withOpacity(
              0.0,
            ), // Top: fully transparent
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: context.textStyles.bodySmall.medium.copyWith(
                color: context.colorsCustom.ButtonLabelPrimary,
              ),
            ),
            verticalSpace(5.h),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    width: 20.w,
                    height: 20.w,
                    fit: BoxFit.fill,
                  ),
                ),
                horizontalSpace(5.w),
                Text(
                  price,
                  style: context.textStyles.bodySmall.bold.copyWith(
                    color: context.colorsCustom.ButtonLabelPrimary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
