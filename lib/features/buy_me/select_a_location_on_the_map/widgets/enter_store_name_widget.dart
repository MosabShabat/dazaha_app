import 'package:dazaha_app/core/constant/exports_widgets.dart';
import '../../../../core/constant/exports_libraries.dart';

Widget EnterStoreNameWidget(BuildContext context) {
  return MyTextField(
    Radius: 10.0.w,
    readOnly: true,
    maxLines: 1,
    BorderSideColor: context.colorsCustom.CardBorder,
    obscureText: false,
    enabledBorderColor: context.colorsCustom.CardBorder,
    // controller: _LastNameTextController,
    keyboardType: TextInputType.name,
    hintText: context.enterStoreName,
    hintStyleColor: context.colorsCustom.TextSecondary,
    HintTextFontFamily: context.textStyles.bodySmall.regular,
    textAlign: TextAlign.start,
    HintTextFontSize: 12.sp,
    onTap: () {
      Get.toNamed(Routes.selectStoreNameScreen);
    },
    fillColor: context.colorsCustom.surfacePrimaryWhite,
  );
}
