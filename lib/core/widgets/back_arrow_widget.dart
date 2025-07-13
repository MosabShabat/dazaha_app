import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget BackArrowWidget(BuildContext context) {
  return Container(
    width: 30.w,
    height: 30.w,
    decoration: BoxDecoration(
      color: context.colorsCustom.surfacePrimaryWhite,
      borderRadius: BorderRadius.circular(40.r),
    ),
    child: Center(
      child: IconButton(
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
        ), // Remove default padding
        icon: Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: context.colorsCustom.surfacePrimaryBlack,
        ),
        onPressed: () {
          Get.back();
        },
      ),
    ),
  );
}
