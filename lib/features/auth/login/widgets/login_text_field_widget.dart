import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget LoginTextFieldWidget(BuildContext context) {
  return Directionality(
    textDirection: TextDirection.ltr,
    child: MyTextField(
      Radius: 10.0,
      readOnly: false,
      maxLines: 1,
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
      obscureText: false,
      enabledBorderColor: context.colorsCustom.CardBorder,
      // controller: _LastNameTextController,
      keyboardType: TextInputType.number,
      hintText: context.mobileNumber,
      hintStyleColor: context.colorsCustom.TextSecondary,
      // hintTextDirection: TextDecoration.,
      HintTextFontFamily: context.textStyles.titleSmall.regular.fontFamily,
      HintTextFontSize: 15.0.sp,
      fillColor: context.colorsCustom.surfacePrimaryWhite,
      prefixIcon: Container(
        margin: const EdgeInsets.only(left: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.add_ic_call_outlined),
            horizontalSpace(5.w),
            Text('+946', style: context.textStyles.bodySmall.regular),
          ],
        ),
      ),
    ),
  );
}
