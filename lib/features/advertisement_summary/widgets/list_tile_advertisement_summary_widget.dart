import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';

Widget ListTileAdvertisementSummaryWidget(
  BuildContext context, {
  required String img,
  required String title,
  required String subTitle,
  required bool isShow,
  required bool isSvgImage,
  required bool isMap,
  lat,
  lng,
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
      Spacer(),
      isMap
          ? Icon(
              Icons.arrow_forward_ios,
              color: context.colorsCustom.surfacePrimaryBlack,
              size: 20.sp,
            ).onTap(() async {
              log('${lat} ');
              log('${lng} ');

              final double destinationLat =
                  double.tryParse(lat.toString()) ?? 0.0;
              final double destinationLng =
                  double.tryParse(lng.toString()) ?? 0.0;

              final Uri googleMapsUri = Uri.parse(
                'https://www.google.com/maps/dir/?api=1&destination=$destinationLat,$destinationLng&travelmode=driving',
              );

              if (await canLaunchUrl(googleMapsUri)) {
                await launchUrl(
                  googleMapsUri,
                  mode: LaunchMode.externalApplication,
                );
              } else {
                Get.snackbar('خطأ', 'تعذّر فتح Google Maps');
              }
              //${lng}
              // Get.to(
              //   () => MapScreen(
              //     lat: double.tryParse(lat.toString()) ?? 0.0,
              //     lng: double.tryParse(lng.toString()) ?? 0.0,
              //   ),
              // );
            })
          : SizedBox.shrink(),
    ],
  ).box.width(Width).make().paddingOnly(bottom: 10.h);
}
