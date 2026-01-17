import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';

Widget DelInfoWidget(
  BuildContext context, {
  required title,
  required DelText,
  required DetText,
  required lat,
  required lng,
  required conWidth,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            textAlign: TextAlign.start,
            maxLines: 5,
            style: context.textStyles.labelMedium.regular.copyWith(
              color: context.colorsCustom.TextSecondary,
              fontSize: 12.sp,
            ),
          ),
          lat != null && lng != null
              ? Icon(
                  Icons.arrow_forward_ios,
                  color: context.colorsCustom.surfacePrimaryBlack,
                  size: 20.sp,
                )
              : SizedBox.shrink(),
        ],
      ).box.height(20.h).make().onTap(() async {
        if (lat != null && lng != null) {
          // 1️⃣ صلاحية الموقع
          PermissionStatus status = await Permission.location.status;
          if (!status.isGranted) {
            status = await Permission.location.request();
            if (!status.isGranted) {
              Get.snackbar(
                'ملاحظة',
                'يجب تفعيل الموقع للوصول إلى الخرائط',
                snackPosition: SnackPosition.BOTTOM,
              );
              return;
            }
          }

          final double destinationLat = double.tryParse(lat.toString()) ?? 0.0;
          final double destinationLng = double.tryParse(lng.toString()) ?? 0.0;

          if (GetPlatform.isAndroid) {
            // Android → رابط جوجل مابس للويب
            final Uri googleMapsUrl = Uri.parse(
              'https://www.google.com/maps/dir/?api=1&destination=$destinationLat,$destinationLng&travelmode=driving',
            );
            if (await canLaunchUrl(googleMapsUrl)) {
              await launchUrl(
                googleMapsUrl,
                mode: LaunchMode.externalApplication,
              );
            } else {
              Get.snackbar(
                'خطأ',
                'تعذّر فتح Google Maps',
                snackPosition: SnackPosition.BOTTOM,
              );
            }
          } else if (GetPlatform.isIOS) {
            // iOS → Google Maps app إذا موجود، وإلا Apple Maps
            final Uri googleMapsAppUri = Uri.parse(
              'comgooglemaps://?daddr=$destinationLat,$destinationLng&directionsmode=driving',
            );
            final Uri appleMapsUri = Uri.parse(
              'http://maps.apple.com/?daddr=$destinationLat,$destinationLng&dirflg=d',
            );

            if (await canLaunchUrl(googleMapsAppUri)) {
              await launchUrl(
                googleMapsAppUri,
                mode: LaunchMode.externalApplication,
              );
            } else if (await canLaunchUrl(appleMapsUri)) {
              await launchUrl(
                appleMapsUri,
                mode: LaunchMode.externalApplication,
              );
            } else {
              Get.snackbar(
                'خطأ',
                'تعذّر فتح الخرائط',
                snackPosition: SnackPosition.BOTTOM,
              );
            }
          }
        }
      }),

      Text(
        DelText,
        textAlign: TextAlign.start,
        maxLines: 5,
        style: context.textStyles.labelMedium.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ).box.width(250.w).make(),
      verticalSpace(5.h),
      Text(
        DetText,
        textAlign: TextAlign.start,
        maxLines: 5,
        style: context.textStyles.labelMedium.regular.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),
    ],
  ).box.width(conWidth).make();
}
