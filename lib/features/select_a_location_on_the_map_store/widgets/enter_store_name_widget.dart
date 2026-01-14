import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';

Widget EnterStoreNameWidget(BuildContext context, {controller, onSubmitted}) {
  return MyTextField(
    Radius: 10.0.w,
    readOnly: false,
    maxLines: 1,
    BorderSideColor: context.colorsCustom.CardBorder,
    obscureText: false,
    enabledBorderColor: context.colorsCustom.CardBorder,
    controller: controller,
    textInputAction: TextInputAction.done,

    keyboardType: TextInputType.name,
    hintText: context.enterStoreName,
    hintStyleColor: context.colorsCustom.TextSecondary,
    HintTextFontFamily: context.textStyles.bodySmall.regular.fontFamily,
    textAlign: TextAlign.start,
    HintTextFontSize: 12.sp,
    onSubmitted: onSubmitted,
    onTap: () {
      //  Get.toNamed(Routes.selectStoreNameScreen);
    },
    fillColor: context.colorsCustom.surfacePrimaryWhite,
  );
}
