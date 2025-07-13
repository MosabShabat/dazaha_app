import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget GridTextWidget(
  BuildContext context, {
  required isSelected,
  required text,
}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: context.textStyles.bodySmall.medium.copyWith(
      color: isSelected
          ? context.colorsCustom.TealGreenSecondary
          : context.colorsCustom.TextPrimary,
      fontSize: 12.sp,
    ),
  );
}
