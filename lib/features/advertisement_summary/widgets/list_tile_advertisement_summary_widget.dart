import 'package:cached_network_image/cached_network_image.dart';
import 'package:permission_handler/permission_handler.dart';
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
  dynamic lat,
  dynamic lng,
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
            )
          : SizedBox.shrink(),
    ],
  ).box.width(Width).make().paddingOnly(bottom: 10.h).onTap(() async {
    if (!isMap) return;

    // ================= صلاحيات الموقع =================
    PermissionStatus status;

    if (GetPlatform.isIOS) {
      // iOS: اطلب صلاحية الموقع عند الاستخدام فقط
      status = await Permission.locationWhenInUse.status;
      if (!status.isGranted) {
        status = await Permission.locationWhenInUse.request();
      }
    } else {
      // Android: اطلب صلاحية الموقع
      status = await Permission.location.status;
      if (!status.isGranted) {
        status = await Permission.location.request();
      }
    }

    if (!status.isGranted) {
      Get.snackbar(
        'ملاحظة',
        'يجب تفعيل الموقع للوصول إلى الخرائط',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // ================= تحويل النصوص للـ double =================
    final double destinationLat = double.tryParse(lat.toString()) ?? 0.0;
    final double destinationLng = double.tryParse(lng.toString()) ?? 0.0;

    // ================= فتح الخرائط =================
    // ================= فتح الخرائط =================
    final String googleMapsUrl =
        "https://www.google.com/maps/search/?api=1&query=$destinationLat,$destinationLng";
    final String appleMapsUrl =
        "https://maps.apple.com/?q=$destinationLat,$destinationLng";

    if (GetPlatform.isAndroid) {
      final Uri uri = Uri.parse(googleMapsUrl);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        // إذا فشل جوجل ماب، جرب فتحه في المتصفح كحل أخير
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      }
    } else if (GetPlatform.isIOS) {
      final Uri googleUri = Uri.parse(
        "comgooglemaps://?q=$destinationLat,$destinationLng",
      );
      final Uri appleUri = Uri.parse(appleMapsUrl);

      if (await canLaunchUrl(googleUri)) {
        await launchUrl(googleUri, mode: LaunchMode.externalApplication);
      } else if (await canLaunchUrl(appleUri)) {
        await launchUrl(appleUri, mode: LaunchMode.externalApplication);
      } else {
        Get.snackbar(
          'خطأ',
          'تعذّر فتح الخرائط',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  });
}
