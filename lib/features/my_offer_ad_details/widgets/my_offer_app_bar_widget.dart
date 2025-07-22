import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/features/my_offer_ad_details/widgets/app_bar_bottom_sheet_widget.dart';

AppBar MyOfferAppBarWidget(BuildContext context) {
  return AppBar(
    surfaceTintColor: context.colorsCustom.surfacePrimaryWhite,
    backgroundColor: context.colorsCustom.surfacePrimaryWhite,
    leading: Padding(
      padding: EdgeInsets.all(10.0.w),
      child:
          Container(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 8.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.r),
              color: context.colorsCustom.surfacePrimaryWhite,
            ),
            child: Center(child: Icon(Icons.arrow_back_ios)),
          ).onTap(() {
            Get.back();
          }),
    ),
    actions: [
      Icon(Icons.more_horiz, color: context.colorsCustom.surfacePrimaryBlack)
          .box
          .customRounded(BorderRadiusGeometry.circular(24.r))
          .border(color: context.colorsCustom.surfacePrimaryBlack, width: 2.w)
          .make()
          .onTap(() {
            AppBarBottomSheetWidget(context);
          }),
      horizontalSpace(10.w),
      Text(
        context.displayManagement,
        style: context.textStyles.bodySmall.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
        ),
      ),
      horizontalSpace(16.w),
    ],
  );
}
