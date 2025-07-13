import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/helpers/theme_exports.dart';

Widget InPutPriceWidget(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        context.howMuchWouldYouLikeToPay,
        textAlign: TextAlign.center,
        maxLines: 1,
        style: context.textStyles.bodyMedium.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),
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
        hintText: '0.0',
        hintStyleColor: context.colorsCustom.surfacePrimaryBlack,
        HintTextFontFamily: context.textStyles.bodyLarge.bold,
        HintTextFontSize: 16.0.sp,
        fillColor: context.colorsCustom.surfacePrimaryWhite,
        prefixIcon: Text(
          'د.ع',
          textAlign: TextAlign.center,
          maxLines: 1,
          style: context.textStyles.bodyLarge.bold.copyWith(
            color: context.colorsCustom.TextPrimary,
          ),
        ).box.padding(EdgeInsetsGeometry.symmetric(vertical: 10.h)).make(),
      ),
    ],
  );
}
