import '../../../core/widgets/app_button_back.dart';

import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';

AppBar CustomScrollAppBarWidget(BuildContext context, {required text, h}) {
  return AppBar(
    toolbarHeight: h ?? 80.h,
    leadingWidth: Width.w,
    surfaceTintColor: context.colorsCustom.surfacePrimaryWhite,
    backgroundColor: context.colorsCustom.surfacePrimaryWhite,
    leading: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(5.h),
        AppButtonBack(context: context),
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
