import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import 'from_to_cou_widget.dart';

Widget PlaceColWidget(
  BuildContext context, {
  required fromTitle,
  required fromDet,
  required toDet,
  required toTitle,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '${context.deliveryPoints}',
        style: context.textStyles.titleSmall.medium.copyWith(
          color: context.colorsCustom.TextSecondary,
        ),
      ),
      verticalSpace(20.h),
      FromToCouWidget(
        context,
        CircleSize: 10.w,
        LineHight: 80.h,
        horSpa: 10.w,
        DelText1: fromTitle,
        DetText1: fromDet,
        DelText2: toTitle,
        DetText2: toDet,
        verticalSpaceItems: 28.h,
      ),
    ],
  );
}
