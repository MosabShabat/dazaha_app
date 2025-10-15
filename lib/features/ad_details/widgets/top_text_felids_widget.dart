import '../../../core/constant/exports_libraries.dart';
import '../../../core/helpers/theme_exports.dart';
import '../../../features/auth/register/widgets/cus_register_info_widget.dart';
import '../controller/ad_details_controller.dart';

Widget TopTextFelidsWidget(
  BuildContext context, {
  required AdDetailsController adDetailsController,
}) {
  return Column(
    children: [
      CusRegisterInfoWidget(
        context,
        titleText: context.whatDoYouNeedHelpWith,
        titleTextColor: context.colorsCustom.TextPrimary,
        HintText: context.forExampleACookAStoveABrokenPotABagOfFlour,
        maxLength: 30,
        maxLines: 1,
        controller: adDetailsController.titleController,
      ),
      CusRegisterInfoWidget(
        context,
        titleText: context.aSimpleExplanationOfTheItems,
        titleTextColor: context.colorsCustom.TextPrimary,
        HintText: context.forExampleSize,
        controller: adDetailsController.decController,
        maxLength: 1000,
        maxLines: 5,
      ),
    ],
  );
}
