import 'package:url_launcher/url_launcher.dart';
// import 'package:permission_handler/permission_handler.dart';
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
        if (lat == null || lng == null) return;

        final double destinationLat = double.tryParse(lat.toString()) ?? 0.0;
        final double destinationLng = double.tryParse(lng.toString()) ?? 0.0;

        if (destinationLat == 0.0 && destinationLng == 0.0) {
          Get.snackbar('خطأ', 'الموقع غير صالح');
          return;
        }

        final Uri uri = Uri.parse(
          "https://www.google.com/maps/dir/?api=1"
          "&destination=$destinationLat,$destinationLng"
          "&travelmode=driving",
        );

        await launchUrl(uri, mode: LaunchMode.externalApplication);
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
