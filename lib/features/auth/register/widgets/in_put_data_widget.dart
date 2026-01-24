import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/helpers/theme_exports.dart';
import '../../../../core/widgets/my_custom_text_field.dart';
import '../../../../features/auth/register/widgets/cus_register_info_widget.dart';

Widget InPutDataWidget(
  BuildContext context, {
  required firstNameController,
  required lastNameController,
  required emailController,
  required KeyboardDoneController doneController, // ⭐
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CusRegisterInfoWidget(
        context,
        titleText: context.firstName,
        titleTextColor: context.colorsCustom.TextSecondary,
        HintText: context.enterFirstName,
        maxLength: null,
        maxLines: null,
        controller: firstNameController,
        doneController: doneController, // ⭐
      ),
      CusRegisterInfoWidget(
        context,
        titleText: context.lastName,
        titleTextColor: context.colorsCustom.TextSecondary,
        HintText: context.enterLastName,
        maxLength: null,
        maxLines: null,
        controller: lastNameController,
        doneController: doneController, // ⭐
      ),
      CusRegisterInfoWidget(
        context,
        titleText: context.email,
        titleTextColor: context.colorsCustom.TextSecondary,
        HintText: context.enterYourEmail,
        maxLength: null,
        keyboardType: TextInputType.emailAddress,
        maxLines: null,
        controller: emailController,
        doneController: doneController, // ⭐
      ),
    ],
  );
}
