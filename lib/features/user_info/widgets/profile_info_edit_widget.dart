import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/auth/register/widgets/cus_register_info_widget.dart';

Widget ProfileInfoEditWidget(BuildContext context, {required isShow}) {
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
        HintTextFontFamily: context.textStyles.bodySmall.medium.fontFamily,
        fontWeight: FontWeight.w500,
      ),
      CusRegisterInfoWidget(
        context,
        titleText: context.lastName,
        titleTextColor: context.colorsCustom.TextPrimary,
        HintText: 'Issa',
        maxLength: null,
        HintTextColor: context.colorsCustom.TextPrimary,
        HintTextFontFamily: context.textStyles.bodySmall.medium.fontFamily,
        maxLines: null,
        fontWeight: FontWeight.w500,
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
              verticalSpace(15.h),
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
                fontWeight: FontWeight.w500,
                suffixIcon: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 10.h,
                  ),
                  child: SvgPicture.asset(AppAssets.svgs.mask_group_icon),
                ),
                fillColor: context.colorsCustom.surfacePrimaryWhite,
              ),
            ],
          ),
        ),
      ),
      verticalSpace(20.h),
      isShow
          ? CusRegisterInfoWidget(
              context,
              titleText: context.email,
              titleTextColor: context.colorsCustom.TextPrimary,
              HintText: 'Emil29apr@gmail.com',
              maxLength: null,
              HintTextColor: context.colorsCustom.TextPrimary,
              HintTextFontFamily:
                  context.textStyles.bodySmall.medium.fontFamily,
              maxLines: null,
              fontWeight: FontWeight.w500,
            )
          : Container(),
    ],
  );
}
