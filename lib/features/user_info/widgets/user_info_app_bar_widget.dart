import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';

AppBar UserInfoAppBarWidget(
  BuildContext context, {
  required widget,
  required Height,
  backgroundColor,
}) {
  return AppBar(
    elevation: 0,
    toolbarHeight: Height + 10.h,
    leadingWidth: Width.w,
    surfaceTintColor:
        backgroundColor ??
        context.colorsCustom.TealGreenSecondary.withOpacity(0.15),
    backgroundColor:
        backgroundColor ??
        context.colorsCustom.TealGreenSecondary.withOpacity(0.15),
    leading: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back_ios, size: 16.sp),
          ).box.width(45.w).make(),
          verticalSpace(10.h),
          widget,
          verticalSpace(10.h),
        ],
      ),
    ),
  );
}
