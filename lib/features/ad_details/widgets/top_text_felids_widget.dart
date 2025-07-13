import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/helpers/theme_exports.dart';
import 'package:dazaha_app/features/auth/register/widgets/cus_register_info_widget.dart';

Widget TopTextFelidsWidget(BuildContext context) {
  return Column(
    children: [
      CusRegisterInfoWidget(
        context,
        titleText: context.whatDoYouNeedHelpWith,
        titleTextColor: context.colorsCustom.TextPrimary,
        HintText: context.forExampleACookAStoveABrokenPotABagOfFlour,
        maxLength: 30,
        maxLines: 1,
      ),
      CusRegisterInfoWidget(
        context,
        titleText: context.aSimpleExplanationOfTheItems,
        titleTextColor: context.colorsCustom.TextPrimary,
        HintText: context.forExampleSize,
        maxLength: 1000,
        maxLines: 5,
      ),
    ],
  );
}
