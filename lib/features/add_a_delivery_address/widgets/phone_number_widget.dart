import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/helpers/extensions/extensions_text_style_variants.dart';
import 'package:dazaha_app/core/helpers/extensions/extensions_text_styles.dart';

Widget PhoneNumberWidget(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        context.mobileNumber,
        textAlign: TextAlign.start,
        maxLines: 1,
        style: context.textStyles.titleSmall.medium.copyWith(
          color: context.colorsCustom.TextSecondary,
        ),
      ),
      verticalSpace(5.h),
      MyTextField(
        Radius: 10.0,
        readOnly: false,
        maxLines: 1,
        obscureText: false,
        enabledBorderColor: context.colorsCustom.CardBorder,
        // controller: _LastNameTextController,
        keyboardType: TextInputType.number,
        hintText: context.mobileNumber,
        hintStyleColor: context.colorsCustom.TextSecondary,
        HintTextFontFamily: context.textStyles.titleSmall.regular.fontFamily,
        HintTextFontSize: 14.0.sp,
        fillColor: context.colorsCustom.surfacePrimaryWhite,
        suffixIcon:
            Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '+946',
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: context.textStyles.bodySmall.regular.copyWith(
                        color: context.colorsCustom.TextSecondary,
                      ),
                    ),
                    Icon(Icons.add_ic_call_outlined),
                  ],
                ).box
                .width(context.screenWidth / 6)
                .margin(EdgeInsetsGeometry.all(10))
                .make(),
      ),
      verticalSpace(20.h),
    ],
  );
}
