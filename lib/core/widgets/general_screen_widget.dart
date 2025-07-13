import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget GeneralScreenWidget(BuildContext context, {required List<Widget> wid}) {
  return SingleChildScrollView(
    physics: const BouncingScrollPhysics(), // <-- This is what you want
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: wid)
        .box
        .width(Width)
        .padding(EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h))
        .color(context.colorsCustom.surfacePrimaryWhite)
        .make(),
  );
}
