import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/auth/register/widgets/cus_register_info_widget.dart';

Widget ProfileInfoEditWidget(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CusRegisterInfoWidget(
        context,
        titleText: context.firstName,
        titleTextColor: context.colorsCustom.TextPrimary,
        HintText: 'Mohammed',
        maxLength: null,
        maxLines: null,
        HintTextColor: context.colorsCustom.TextPrimary,
        HintTextFontFamily: context.textStyles.bodySmall.medium,
      ),
      CusRegisterInfoWidget(
        context,
        titleText: context.lastName,
        titleTextColor: context.colorsCustom.TextPrimary,
        HintText: 'Issa',
        maxLength: null,
        HintTextColor: context.colorsCustom.TextPrimary,
        HintTextFontFamily: context.textStyles.bodySmall.medium,
        maxLines: null,
      ),
      Container(
        height: 90.h,
        width: Width.w,
        child: GestureDetector(
          onTap: () {
            Get.toNamed(Routes.updateMobileNumberScreen);
          },
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.mobileNumber,
                    style: context.textStyles.bodyMedium.medium.copyWith(
                      color: context.colorsCustom.TextPrimary,
                    ),
                  ),
                  Text(
                    context.update,
                    style: context.textStyles.bodyMedium.regular.copyWith(
                      color: context.colorsCustom.TealGreenSecondary,
                    ),
                  ),
                ],
              ),
              verticalSpace(10.h),
              MyTextField(
                Radius: 8.0,
                textAlign: TextAlign.start,
                readOnly: false,
                maxLines: 1,
                obscureText: false,
                enabledBorderColor: context.colorsCustom.CardBorder,
                // controller: _LastNameTextController,
                keyboardType: TextInputType.number,
                hintText: '+964 123 456 789',
                hintStyleColor: context.colorsCustom.TextSecondary,
                HintTextFontFamily:
                    context.textStyles.bodySmall.medium.fontFamily,
                HintTextFontSize: 12.0.sp,
                suffixIcon: SvgPicture.asset(AppAssets.svgs.mask_group_icon),
                fillColor: context.colorsCustom.surfacePrimaryWhite,
              ),
            ],
          ),
        ),
      ),
      CusRegisterInfoWidget(
        context,
        titleText: context.email,
        titleTextColor: context.colorsCustom.TextPrimary,
        HintText: 'Emil29apr@gmail.com',
        maxLength: null,
        HintTextColor: context.colorsCustom.TextPrimary,
        HintTextFontFamily: context.textStyles.bodySmall.medium,
        maxLines: null,
      ),
    ],
  );
}
