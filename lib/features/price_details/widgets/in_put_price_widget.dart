import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget InPutPriceWidget(
  BuildContext context, {
  required isShow,
  FW,
  textColor,
  hintText,
  FZ,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      isShow
          ? Text(
              context.howMuchWouldYouLikeToPay,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: context.textStyles.bodyMedium.medium.copyWith(
                color: context.colorsCustom.TextPrimary,
              ),
            )
          : Container(),
      verticalSpace(10.h),
      MyTextField(
        Radius: 10.0,
        textAlign: TextAlign.center,
        readOnly: false,
        maxLines: 1,
        obscureText: false,
        enabledBorderColor: context.colorsCustom.CardBorder,
        // controller: _LastNameTextController,
        keyboardType: TextInputType.name,
        hintText: hintText ?? '0.0',
        hintStyleColor: textColor ?? context.colorsCustom.surfacePrimaryBlack,
        HintTextFontFamily: context.textStyles.bodyLarge.bold.fontFamily,
        HintTextFontSize:FZ?? 16.0.sp,
        fontWeight: FW ?? FontWeight.w700,
        fillColor: context.colorsCustom.surfacePrimaryWhite,
        suffixIcon: Text(
          'د.ع',
          textAlign: TextAlign.center,
          maxLines: 1,
          style: context.textStyles.bodyLarge.bold.copyWith(
            color: textColor ?? context.colorsCustom.TextPrimary,
            fontWeight: FW,
            fontSize: FZ??16.sp
          ),
        ).box.padding(EdgeInsetsGeometry.symmetric(vertical: 10.h)).make(),
      ),
    ],
  );
}
