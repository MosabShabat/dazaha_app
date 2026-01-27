import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../features/auth/register/widgets/cus_register_info_widget.dart';

Widget InPutRepWidget(
  BuildContext context, {
  required KeyboardDoneController doneController,
}) {
  return Column(
    children: [
      CusRegisterInfoWidget(
        context,
        titleText: context.problemName,
        titleTextColor: context.colorsCustom.TextPrimary,
        HintText: context.exampleIHaveADeliveryProblem,
        maxLines: 1,
        maxLength: null,
        HintTextColor: context.colorsCustom.TextPrimary,
        fontWeight: FontWeight.w300,
        doneController: doneController,
      ),
      verticalSpace(10.h),
      CusRegisterInfoWidget(
        context,
        titleText: context.descriptionOfTheProblem,
        titleTextColor: context.colorsCustom.TextPrimary,
        HintText: context.exampleThereIsAProblem,
        maxLines: 5,
        maxLength: null,
        HintTextColor: context.colorsCustom.TextPrimary,
        fontWeight: FontWeight.w300,
        doneController: doneController,
      ),
      verticalSpace(10.h),
    ],
  );
}
