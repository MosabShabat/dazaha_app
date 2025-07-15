import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

AppBar UserInfoAppBarWidget(BuildContext context, {required widget}) {
  return AppBar(
    elevation: 0,
    toolbarHeight: 160.h,
    leadingWidth: 165.w,
    surfaceTintColor: context.colorsCustom.TealGreenSecondary,
    backgroundColor: context.colorsCustom.TealGreenSecondary,
    leading: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios),
        ),
        verticalSpace(10.h),
        widget,
      ],
    ),
  );
}
