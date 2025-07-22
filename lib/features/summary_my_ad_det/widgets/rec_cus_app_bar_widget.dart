import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/summary/widgets/loc_row_widget.dart';

AppBar RecCusAppBarWidget(BuildContext context) {
  return AppBar(
    elevation: 0,
    toolbarHeight: 120.h,
    leadingWidth: 200.w,
    surfaceTintColor: context.colorsCustom.TealGreenSecondary.withOpacity(0.2),
    backgroundColor: context.colorsCustom.TealGreenSecondary.withOpacity(0.2),
    leading: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back_ios),
          ),
          verticalSpace(10.h),
          LocRowWidget(
            context,
            h: 32.w,
            w: 32.w,
            style: context.textStyles.bodyMedium.bold.copyWith(
              color: context.colorsCustom.TealGreenSecondary,
              fontSize: 20.sp,
            ),
          ),
        ],
      ),
    ),
  );
}
