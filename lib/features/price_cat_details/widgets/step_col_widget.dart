import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget StepColWidget(
  BuildContext context, {
  required CircleSize,
  required LineHight,
  required horSpa,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CircleAvatar(
        radius: CircleSize,
        backgroundColor: context.colorsCustom.TealGreenSecondary,
      ),
      Container(
        width: 2,
        height: LineHight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              context.colorsCustom.TealGreenSecondary,
              context.colorsCustom.TealGreenSecondary.withOpacity(0.6),
              context.colorsCustom.surfacePrimaryWhite,
            ],
            stops: [
              0.1, // Top 2/3 solid color
              0.5, // Start blending
              2.0, // Fully white at the bottom
            ],
          ),
        ),
      ).paddingSymmetric(horizontal: horSpa, vertical: 4.h),

      CircleAvatar(
        radius: CircleSize,
        backgroundColor: context.colorsCustom.CardBorder,
      ),
    ],
  );
}
