import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dotted_decoration/dotted_decoration.dart';

Widget CameraInPutDataWidget(BuildContext context, {required title}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: context.textStyles.bodyMedium.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),
      verticalSpace(10.h),
      Container(
        width: Width.w,
        height: 180.h,
        decoration: DottedDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: context.colorsCustom.CardBorder,
          shape: Shape.box,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(
                AppAssets.svgs.gallery_add_icon,
                width: 32.w,
                height: 32.h,
              ),
            ),
            verticalSpace(5.h),
            Text(
              context.addAPhoto,
              style: context.textStyles.bodySmall.medium.copyWith(
                color: context.colorsCustom.TextSecondary,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
