import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../features/auth/register/widgets/cus_register_info_widget.dart';

Widget ProfileInfoEditWidget(
  BuildContext context, {
  required bool isShow,
  required String firstName,
  required String lastName,
  String? email,
  required String mobileNumber,
  required TextEditingController firstNameController,
  required TextEditingController lastNameController,
  TextEditingController? emailController,
}) {
  Widget buildTextField({
    required String title,
    required String hint,
    required TextEditingController controller,
    bool readOnly = false,
  }) {
    return CusRegisterInfoWidget(
      context,
      maxLines: null,
      maxLength: null,
      titleText: title,
      titleTextColor: context.colorsCustom.TextPrimary,
      HintText: hint,
      HintTextColor: context.colorsCustom.TextPrimary,
      HintTextFontFamily: context.textStyles.bodySmall.medium.fontFamily,
      fontWeight: FontWeight.w500,
      readOnly: readOnly,
      controller: controller,
    );
  }

  Widget buildMobileField() {
    return Container(
      height: 90.h,
      width: Width.w,
      child: GestureDetector(
        onTap: () => Get.toNamed(Routes.updateMobileNumberScreen),
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
              readOnly: true,
              maxLines: 1,
              obscureText: false,
              enabledBorderColor: context.colorsCustom.CardBorder,
              keyboardType: TextInputType.number,
              hintText: mobileNumber,
              hintStyleColor: context.colorsCustom.TextSecondary,
              HintTextFontFamily:
                  context.textStyles.bodySmall.medium.fontFamily,
              HintTextFontSize: 12.0.sp,
              fontWeight: FontWeight.w500,
              suffixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                child: SvgPicture.asset(AppAssets.svgs.mask_group_icon),
              ),
              fillColor: context.colorsCustom.surfacePrimaryWhite,
            ),
          ],
        ),
      ),
    );
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      buildTextField(
        title: context.firstName,
        hint: firstName,
        controller: firstNameController,
      ),
      buildTextField(
        title: context.lastName,
        hint: lastName,
        controller: lastNameController,
      ),
      verticalSpace(10.h),
      buildMobileField(),
      verticalSpace(20.h),
      if (isShow && emailController != null)
        buildTextField(
          title: context.email,
          hint: email ?? '',
          controller: emailController,
        ),
    ],
  );
}
