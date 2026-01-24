import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';

Widget PlateNumberWidget(BuildContext context, {required plateController}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        context.plateNumber,
        style: context.textStyles.bodyMedium.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),
      verticalSpace(5.h),
      Text(
        context.enterTheCarPlateNumber,
        style: context.textStyles.bodyMedium.regular.copyWith(
          color: context.colorsCustom.TextSecondary,
        ),
      ),
      verticalSpace(15.h),
      MyTextField(
        context,
        Radius: 8.0.r,
        textAlign: TextAlign.center,
        readOnly: false,
        maxLines: 1,
        showDoneButton: true, // ⭐ هنا
        maxLength: 8,
        keyboardDoneController: plateController.doneController, // ⭐ هنا,
        textInputAction: TextInputAction.done, // ✅ زر Done
        onSubmitted: (_) {
          FocusScope.of(
            context,
          ).unfocus(); // ✅ لإخفاء الكيبورد عند الضغط على Done
        },
        obscureText: false,
        enabledBorderColor: context.colorsCustom.CardBorder,
        controller: plateController,
        keyboardType: TextInputType.name,
        hintText: context.exampleZ33245,
        hintStyleColor: context.colorsCustom.TextSecondary,
        HintTextFontFamily: context.textStyles.bodyLarge.regular.fontFamily,
        HintTextFontSize: 16.0.sp,
        fontWeight: FontWeight.w400,
        counterText: '',
        fillColor: context.colorsCustom.surfacePrimaryWhite,
      ),
      verticalSpace(20.sp),
    ],
  );
}
