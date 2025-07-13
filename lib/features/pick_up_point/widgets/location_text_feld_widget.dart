import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget LocationTextFieldWidget(
  BuildContext context, {
  required text,
  required textColor,
  required textSize,
  required textFontFamily,
}) {
  return MyTextField(
    Radius: 10.0.w,
    readOnly: true,
    maxLines: 1,
    BorderSideColor: context.colorsCustom.CardBorder,
    obscureText: false,
    enabledBorderColor: context.colorsCustom.CardBorder,
    // controller: _LastNameTextController,
    keyboardType: TextInputType.name,
    hintText: text,
    hintStyleColor: textColor,
    HintTextFontFamily: textFontFamily,
    textAlign: TextAlign.start,
    HintTextFontSize: textSize,
    onTap: () {
      Get.toNamed(Routes.selectALocationOnTheMapScreen);
    },
    fillColor: context.colorsCustom.surfacePrimaryWhite,
    suffixIcon: SvgPicture.asset(
      AppAssets.svgs.location_add_icon,
    ).box.width(24.w).padding(EdgeInsetsGeometry.all(10.w)).make(),
  );
}
