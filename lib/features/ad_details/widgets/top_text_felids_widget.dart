import '../../../core/constant/exports_libraries.dart';
import '../../../core/helpers/theme_exports.dart';
import '../../../features/auth/register/widgets/cus_register_info_widget.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../controller/ad_details_controller.dart';

Widget TopTextFelidsWidget(
  BuildContext context, {
  required AdDetailsController adDetailsController,
}) {
  final OrderDataController orderController = Get.find();
  return Column(
    children: [
      CusRegisterInfoWidget(
        context,
        titleText:
            orderController.serviceUuid.value ==
                '153a7042-eb9e-42b8-9d5c-498623adb5da'
            ? context.whatGiftWouldYouLikeToGive
            : context.whatDoYouNeedHelpWith,
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
        keyboardType: TextInputType.multiline,
        maxLength: 1000,
        maxLines: 5,
      ),
    ],
  );
}
