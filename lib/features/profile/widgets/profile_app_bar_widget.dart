import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';

AppBar ProfileAppBarWidget(BuildContext context) {
  int tapCount = 0;

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
          GestureDetector(
            onTap: () {
              tapCount++;

              if (tapCount == 7) {
                tapCount = 0; // إعادة التصفير
                Get.toNamed(Routes.programmerInfoWidget);
              }
            },
            child: Text(
              context.profile,
              style: context.textStyles.bodyLarge.bold.copyWith(
                color: context.colorsCustom.TextPrimary,
                fontSize: 20.sp,
              ),
            ),
          ),
          verticalSpace(20.h),
        ],
      ),
    ),
  );
}
