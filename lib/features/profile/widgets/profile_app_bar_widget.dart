import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

AppBar ProfileAppBarWidget(BuildContext context) {
  return AppBar(
    elevation: 0,
    toolbarHeight: Width * 0.25,
    leadingWidth: Width.w,
    surfaceTintColor: context.colorsCustom.TealGreenSecondary.withOpacity(0.4),
    backgroundColor: context.colorsCustom.TealGreenSecondary.withOpacity(0.4),
    leading: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.profile,
            style: context.textStyles.bodyLarge.bold.copyWith(
              color: context.colorsCustom.TextPrimary,
              fontSize: 20.sp,
            ),
          ),
          verticalSpace(20.h),
        ],
      ),
    ),
  );
}
