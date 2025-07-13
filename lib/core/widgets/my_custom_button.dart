import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget CustomButton(
  BuildContext context, {
  required text,
  required textColor,
  double? fontSize,
  String? fontFamily,
  FontWeight? fontWeight,
  required backgroundColor,
  required width,
  required height,
}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.r),
      color: backgroundColor,
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontFamily: fontFamily,
          fontWeight: fontWeight, // ✅ now we apply it
        ),
      ),
    ),
  );
}

Widget GeneralBottomAppWidget(
  BuildContext context, {
  required text,
  required onTap,
  backgroundColorB,
  textColorB,
  String? fontFamily,
  FontWeight? fontWeight, // ✅ add this
}) {
  return CustomButton(
    context,
    text: text,
    textColor: textColorB ?? context.colorsCustom.surfacePrimaryWhite,
    fontFamily: fontFamily,
    fontWeight: fontWeight == null ? FontWeight.w500 : fontWeight,
    fontSize: 16.0.sp,
    height: 56.0.h,
    width: Width,
    backgroundColor:
        backgroundColorB ?? context.colorsCustom.TealGreenSecondary,
  ).box.make().onTap(onTap);
}
