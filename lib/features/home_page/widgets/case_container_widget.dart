import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget CaseContainerWidget(
  BuildContext context, {
  required height,
  required text,
  required textColor,
  required textSize,
  required BackGroundColor,
  required horizontalPadding,
  required borderRadius,
  colorBorder,
  required onTap,
}) {
  return Container(
    height: height,
    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
    decoration: BoxDecoration(
      color: BackGroundColor,
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      border: Border.all(
        color: colorBorder == null ? BackGroundColor : colorBorder,
      ),
    ),
    child: Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: context.textStyles.bodySmall.medium.copyWith(
          color: textColor,
          fontSize: textSize,
        ),
      ),
    ),
  ).onTap(onTap);
}
