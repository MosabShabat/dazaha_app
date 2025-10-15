import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import 'del_info_widget.dart';
import 'step_col_widget.dart';

Widget FromToCouWidget(
  BuildContext context, {
  required CircleSize,
  required LineHight,
  required horSpa,
  required DelText1,
  required DetText1,
  required verticalSpaceItems,
  required DelText2,
  required DetText2,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      StepColWidget(
        context,
        CircleSize: CircleSize,
        LineHight: LineHight,
        horSpa: horSpa,
      ),
      horizontalSpace(5.w),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DelInfoWidget(
            context,
            title: context.deliveryFrom,
            DelText: DelText1,
            DetText: DetText1,
          ),
          verticalSpace(verticalSpaceItems),
          DelInfoWidget(
            context,
            title: context.deliveryTo,
            DelText: DelText2,
            DetText: DetText2,
          ),
        ],
      ),
    ],
  );
}
