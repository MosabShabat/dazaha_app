import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget CenterIconWidget(BuildContext context, {required icon, required onTap}) {
  return Container(
    width: 30.w,
    height: 30.w,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: context.colorsCustom.surfacePrimaryBlack,
        width: 1.5,
      ),
    ),
    child: Center(
      child: IconButton(
        padding: EdgeInsets.zero,
        iconSize: 18,
        icon: Icon(icon),
        color: context.colorsCustom.surfacePrimaryBlack,
        onPressed: onTap,
      ),
    ),
  );
}
