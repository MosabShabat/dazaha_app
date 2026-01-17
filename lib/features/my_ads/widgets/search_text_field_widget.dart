import 'dart:io';

import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';

Widget SearchTextFieldWidget(
  BuildContext context, {
  controller,
  Function(String)? onSubmitted,
  onChanged,
}) {
  return MyTextField(
    controller: controller,
    textAlign: TextAlign.start,
    textAlignVertical: TextAlignVertical.center,
    maxLines: 1,
    onChanged: onChanged,
    onSubmitted: onSubmitted,
    textInputAction: TextInputAction.done,

    enabledBorderColor: context.colorsCustom.CardBorder,
    fillColor: context.colorsCustom.surfacePrimaryWhite,
    hintText: context.search,
    hintStyleColor: context.colorsCustom.TextSecondary,
    HintTextFontFamily: context.textStyles.bodySmall.regular.fontFamily,
    HintTextFontSize: 12.0.sp,
    Radius: 10.0.r,
    isDense: true,
    contentPadding: EdgeInsets.symmetric(
      vertical: Platform.isIOS ? 14.h : 10.h,
      horizontal: 12.w,
    ),
    prefixIcon: Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Icon(
        Icons.search,
        color: context.colorsCustom.surfacePrimaryBlack,
        size: 22.w,
      ),
    ),
  );
}
