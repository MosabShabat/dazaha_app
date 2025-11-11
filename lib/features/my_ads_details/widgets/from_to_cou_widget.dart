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
  required fromLat,
  required fromLng,
  required toLat,
  required toLng,
  required conWidth,
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
            lat: fromLat,
            lng: fromLng,
            conWidth: conWidth,
          ),

          verticalSpace(verticalSpaceItems),
          DelInfoWidget(
            context,
            title: context.deliveryTo,
            DelText: DelText2,
            DetText: DetText2,
            lat: toLat,
            lng: toLng,
            conWidth: conWidth,
          ),
        ],
      ),
    ],
  );
  //dac4973f-8dbd-4fad-9d92-d05e57b4ca90
  //ccab053c-4cf9-47bf-8c57-e5f171bcc141
  //100e3df4-f0d4-421c-a1d0-1c9e725d9c2a
  //"type": "order_in_progress",
  // "type": "new_order",
  //"type": "new_order",
}
