import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

AppBar UserInfoAppBarWidget(
  BuildContext context, {
  required widget,
  required Height,
}) {
  return AppBar(
    elevation: 0,
    toolbarHeight: Height,
    leadingWidth: Width.w,
    surfaceTintColor: context.colorsCustom.TealGreenSecondary.withOpacity(0.15),
    backgroundColor: context.colorsCustom.TealGreenSecondary.withOpacity(0.15),
    leading: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Column(
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
    ),
  );
}
