import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget SearchTextFieldWidget(BuildContext context) {
  return MyTextField(
    Radius: 10.0.r,
    textAlign: TextAlign.start,
    readOnly: false,
    maxLines: 1,
    obscureText: false,
    enabledBorderColor: context.colorsCustom.CardBorder,
    // controller: _LastNameTextController,
    keyboardType: TextInputType.name,
    hintText: context.search,
    hintStyleColor: context.colorsCustom.TextSecondary,
    HintTextFontFamily: context.textStyles.bodySmall.regular,
    HintTextFontSize: 12.0.sp,
    fillColor: context.colorsCustom.surfacePrimaryWhite,
    prefixIcon: Icon(
      Icons.search,
      color: context.colorsCustom.surfacePrimaryBlack,
      size: 30.w,
    ),
  );
}
