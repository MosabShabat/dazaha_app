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
      ).box.height(20.h).make()..onTap(() async {
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
