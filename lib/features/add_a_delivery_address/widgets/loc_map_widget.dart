import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../features/pick_up_point/widgets/location_text_feld_widget.dart';

Widget LocMapWidget(BuildContext context) {
  final KeyboardDoneController doneController = KeyboardDoneController();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        context.locationOnMap,
        textAlign: TextAlign.start,
        maxLines: 1,
        style: context.textStyles.bodyMedium.medium.copyWith(
          color: context.colorsCustom.TextSecondary,
        ),
      ),
      verticalSpace(15.h),
      LocationTextFieldWidget(
        context,
        text: context.locationOnMap,
        keyboardDoneController: doneController,
        textColor: context.colorsCustom.TextSecondary,
        textSize: 10.0.sp,
        textFontFamily: context.textStyles.labelSmall.regular.fontFamily,
      ),
    ],
  );
}
