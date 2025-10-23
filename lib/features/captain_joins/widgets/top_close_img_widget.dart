import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';

Widget TopCloseImgWidget() {
  return Image.asset(
    AppAssets.images.group_120857_png,
    width: 320.w,
    height: 200.h,
    fit: BoxFit.fill,
  ).box.alignCenter.make();
}
