import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../core/widgets/app_text_form_field.dart';

Widget LoginTextFieldWidget(
  BuildContext context, {
  controller,
  hintText,
  readOnly,
  hintCenter,
  textAlign,
}) {
  return Container(
    height: 52.h,
    decoration: BoxDecoration(
      border: Border.all(color: context.colorsCustom.CardBorder),
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Row(
      textDirection: TextDirection.ltr,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            textDirection: TextDirection.ltr,
            children: [
              SvgPicture.asset(
                AppAssets.svgs.mask_group_icon,
                width: 36.w,
                height: 24.h,
              ),
              horizontalSpace(8),
              Text(
                context.countryCode,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: context.colorsCustom.TextPrimary,
                  fontFamily: 'sans',
                ),
                textDirection: TextDirection.ltr,
              ),
            ],
          ),
        ),
        Expanded(
          child: AppTextFormField(
            controller: controller,
            textDirection: TextDirection.ltr,
            maxLength: 10,
            hintCenter: hintCenter,
            textAlign: textAlign,
            readOnly: readOnly ?? false,
            hasBorder: false,
            keyboardType: TextInputType.phone,
            hintText: hintText ?? context.mobileNumber,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.enterPhoneForLoginOrSignup;
              }
              return null;
            },
          ),
        ),
      ],
    ),
  );
}
