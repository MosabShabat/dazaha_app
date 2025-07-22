import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget ProfileImageWidget(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Stack(
        children: [
          CircleAvatar(
            radius: 42.5.w,
            backgroundImage: AssetImage(AppAssets.images.goku),
          ),
          Positioned(
            bottom: -0.0.h,
            child: CircleAvatar(
              radius: 13.5.r,
              backgroundColor: context.colorsCustom.TealGreenSecondary,
              child: SvgPicture.asset(AppAssets.svgs.gallery_edit_icon),
            ),
          ),
        ],
      ),
    ],
  );
}
