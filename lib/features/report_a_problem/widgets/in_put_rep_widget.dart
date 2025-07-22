import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/auth/register/widgets/cus_register_info_widget.dart';

Widget InPutRepWidget(BuildContext context) {
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
      ),
      verticalSpace(10.h),
    ],
  );
}
