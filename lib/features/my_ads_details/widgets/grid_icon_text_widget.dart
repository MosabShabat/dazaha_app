import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/my_ads_details/widgets/grid_text_widget.dart';

Widget GridIconTextWidget(
  BuildContext context, {
  required isSelect,
  required icon,
  required text,
}) {
  return Row(
    children: [
      SvgPicture.asset(
        icon,
        width: 20.w,
        height: 20.w,
        color: isSelect
            ? context.colorsCustom.TealGreenSecondary
            : context.colorsCustom.SecondaryElement,
      ),
      horizontalSpace(5.w),
      GridTextWidget(context, isSelected: isSelect, text: text),
    ],
  );
}
