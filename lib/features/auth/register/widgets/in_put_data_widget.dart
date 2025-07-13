import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/helpers/theme_exports.dart';
import 'package:dazaha_app/features/auth/register/widgets/cus_register_info_widget.dart';

Widget InPutDataWidget(BuildContext context) {
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
      ),
      CusRegisterInfoWidget(
        context,
        titleText: context.lastName,
        titleTextColor: context.colorsCustom.TextSecondary,
        HintText: context.enterLastName,
        maxLength: null,
        maxLines: null,
      ),
      CusRegisterInfoWidget(
        context,
        titleText: context.email,
        titleTextColor: context.colorsCustom.TextSecondary,
        HintText: context.enterYourEmail,
        maxLength: null,
        maxLines: null,
      ),
    ],
  );
}
