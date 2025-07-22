import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

AppBar CustomScrollAppBarWidget(BuildContext context, {required text}) {
  return AppBar(
    toolbarHeight: 80.h,
    leadingWidth: Width.w,
    surfaceTintColor: context.colorsCustom.surfacePrimaryWhite,
    backgroundColor: context.colorsCustom.surfacePrimaryWhite,
    leading: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(5.h),
        Icon(Icons.arrow_back_ios, size: 15.w).onTap(() => Get.back()),
        verticalSpace(20.h),
        Text(
          text,
          style: context.textStyles.headlineSmall.bold.copyWith(
            color: context.colorsCustom.TextPrimary,
            fontSize: 20.sp,
          ),
        ),
      ],
    ).box.padding(EdgeInsetsGeometry.symmetric(horizontal: 16.w)).make(),
  );
}
