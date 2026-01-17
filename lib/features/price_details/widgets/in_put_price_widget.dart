import 'dart:io';

import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';

Widget InPutPriceWidget(
  BuildContext context, {
  required isShow,
  FW,
  textColor,
  hintText,
  FZ,
  initialValue,
  controller,
  currency,
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
          : const SizedBox(),

      verticalSpace(10.h),
      Platform.isIOS
          ? Text(
              'Done',
              textAlign: TextAlign.end,
              style: context.textStyles.bodyMedium.medium.copyWith(
                color: context.colorsCustom.TealGreenSecondary,
              ),
            ).box.alignBottomLeft.make().onTap(() {
              FocusScope.of(
                context,
              ).unfocus(); // ✅ لإخفاء الكيبورد عند الضغط على Done
            })
          : SizedBox.shrink(),
      Platform.isIOS ? verticalSpace(10.h) : SizedBox.shrink(),

      MyTextField(
        Radius: 10.0,
        textAlign: TextAlign.center,
        readOnly: false,
        maxLines: 1,

        initialValue: initialValue,
        obscureText: false,
        enabledBorderColor: context.colorsCustom.CardBorder,
        controller: controller,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
        onSubmitted: (_) {
          FocusScope.of(
            context,
          ).unfocus(); // ✅ لإخفاء الكيبورد عند الضغط على Done
        },
        hintText: hintText ?? '0.0',
        hintStyleColor: textColor ?? context.colorsCustom.surfacePrimaryBlack,
        HintTextFontFamily: context.textStyles.bodyLarge.bold.fontFamily,
        HintTextFontSize: FZ ?? 16.0.sp,
        fontWeight: FW ?? FontWeight.w700,
        style: context.textStyles.bodyLarge.bold.copyWith(
          color: context.colorsCustom.TextPrimary,
          fontSize: 16.sp,
        ),
        fillColor: context.colorsCustom.surfacePrimaryWhite,
        suffixIcon: Text(
          currency ?? 'د.ع',
          textAlign: TextAlign.center,
          maxLines: 1,
          style: context.textStyles.bodyLarge.bold.copyWith(
            color: textColor ?? context.colorsCustom.TextPrimary,
            fontWeight: FW,
            fontSize: FZ ?? 16.sp,
          ),
        ).box.padding(EdgeInsets.symmetric(vertical: 10.h)).make(),
      ),
    ],
  );
}
