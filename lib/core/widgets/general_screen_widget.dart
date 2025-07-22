import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget GeneralScreenWidget(BuildContext context, {required List<Widget> wid,verH,horW}) {
  return SingleChildScrollView(
    physics: const BouncingScrollPhysics(), // <-- This is what you want
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: wid)
        .box
        .width(Width)
        .padding(EdgeInsets.only(left:horW?? 16.w, right:horW?? 16.w, top:verH ?? 16.h))
        .color(context.colorsCustom.surfacePrimaryWhite)
        .make(),
  );
}
