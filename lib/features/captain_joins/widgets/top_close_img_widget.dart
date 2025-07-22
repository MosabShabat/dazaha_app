import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget TopCloseImgWidget() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SvgPicture.asset(AppAssets.svgs.closeIcon).onTap(() => Get.back()),
        ],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            AppAssets.images.group_120857_png,
            width: 320.w,
            height: 200.h,
            fit: BoxFit.fill,
          ),
        ],
      ),
    ],
  );
}
