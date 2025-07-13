import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';


Widget ImageListViewBuilderWidget(BuildContext context) {
  return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Image.asset(AppAssets.images.goku, fit: BoxFit.cover).box
              .withRounded(value: 8.r)
              .clip(Clip.antiAlias)
              .margin(EdgeInsetsGeometry.symmetric(horizontal: 8.w))
              .width(120.w)
              .height(120.w)
              .make();
        },
      ).box
      // .color(blueColor)
      .width(Width)
      .height(120.w)
      .make();
}
