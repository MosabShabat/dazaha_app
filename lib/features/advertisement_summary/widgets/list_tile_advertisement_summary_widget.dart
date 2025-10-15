import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';

Widget ListTileAdvertisementSummaryWidget(
  BuildContext context, {
  required String img,
  required String title,
  required String subTitle,
  required bool isShow,
  required bool isSvgImage,
}) {
  final textStyleTitle = context.textStyles.bodyMedium.medium.copyWith(
    color: context.colorsCustom.TextPrimary,
  );
  final textStyleSubTitle = context.textStyles.bodySmall.regular.copyWith(
    color: context.colorsCustom.TextPrimary,
  );

  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      isSvgImage
          ? SvgPicture.asset(img, width: 30.w, height: 30.w)
          : CachedNetworkImage(
              imageUrl: img,
              width: 30.w,
              height: 30.w,
              fit: BoxFit.fill,
            ).paddingOnly(top: 8.h),
      horizontalSpace(5.w),
      SizedBox(
        width: 200.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isShow) verticalSpace(8.h),
            Text(title, style: textStyleTitle, maxLines: 5),
            if (isShow) ...[
              verticalSpace(5.h),
              Text(subTitle, style: textStyleSubTitle),
            ],
          ],
        ),
      ),
    ],
  ).box.width(Width).make().paddingOnly(bottom: 10.h);
}
