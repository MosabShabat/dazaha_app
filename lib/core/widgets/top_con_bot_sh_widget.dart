import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';

Widget TopConBotShWidget(BuildContext context) => Container().box
    .width(60.w)
    .height(4.h)
    .customRounded(BorderRadiusGeometry.circular(3.r))
    .color(context.colorsCustom.CardBorder)
    .make();
