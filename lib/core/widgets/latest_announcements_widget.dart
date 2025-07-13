import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget LatestAnnouncementsRowWidget(
  BuildContext context, {
  required text,
  required onPressed,
  required Widget,
  size,
  fontFamily,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        '${text}',
        textAlign: TextAlign.start,
        style: context.textStyles.bodyLarge.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
          fontSize: size == null ? 18.sp : size,
          fontFamily: fontFamily == null
              ? context.textStyles.bodyLarge.medium.fontFamily
              : fontFamily,
        ),
      ),
      TextButton(onPressed: onPressed, child: Widget),
    ],
  ).box.width(Width).make();
}
