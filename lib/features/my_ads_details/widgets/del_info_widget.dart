import 'package:url_launcher/url_launcher.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import 'dart:io';

Future<void> openMap(double lat, double lng) async {
  Uri uri;

  if (Platform.isIOS) {
    // ✅ Apple Maps (أفضل وأضمن حل لـ iOS)
    uri = Uri.parse('http://maps.apple.com/?daddr=$lat,$lng&dirflg=d');
  } else {
    // ✅ Google Maps (Android)
    uri = Uri.parse('geo:$lat,$lng?q=$lat,$lng');
  }

  await launchUrl(uri, mode: LaunchMode.externalApplication);
}

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
        if (destinationLat == 0.0 && destinationLng == 0.0) return;

        await openMap(destinationLat, destinationLng);
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
