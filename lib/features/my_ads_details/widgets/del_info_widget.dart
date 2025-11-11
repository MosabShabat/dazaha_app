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
          // التحقق من صلاحية الموقع
          PermissionStatus status = await Permission.location.status;

          if (status.isDenied || status.isRestricted) {
            // طلب الصلاحية
            status = await Permission.location.request();
            if (!status.isGranted) {
              // إذا رفض المستخدم، أرسل إلى إعدادات التطبيق
              Get.snackbar('ملاحظة', 'يجب تفعيل الموقع للوصول إلى الخرائط');
              openAppSettings(); // يفتح إعدادات التطبيق
              return;
            }
          }

          // إذا الصلاحية متاحة
          final double destinationLat = double.tryParse(lat.toString()) ?? 0.0;
          final double destinationLng = double.tryParse(lng.toString()) ?? 0.0;

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
