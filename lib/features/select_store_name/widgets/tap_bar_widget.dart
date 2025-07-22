import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget TapBarWidget(BuildContext context) {
  return DefaultTabController(
    length: 2,
    child: Container(
      height: Width * 0.1,
      width: Width * 0.25,
      padding: EdgeInsetsDirectional.symmetric(horizontal: 5.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: context.colorsCustom.CardBackgroundLightGray,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: TabBar(
        dividerColor: context.colorsCustom.CardBackgroundLightGray,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: context.colorsCustom.surfacePrimaryBlack,
          borderRadius: BorderRadius.circular(25.0),
        ),
        labelColor: context.colorsCustom.surfacePrimaryWhite,
        unselectedLabelColor: context.colorsCustom.TextPrimary,
        labelPadding: EdgeInsetsDirectional.symmetric(
          horizontal: 5.w,
          vertical: 4.h,
        ),
        labelStyle: context.textStyles.labelSmall.medium.copyWith(
          color: context.colorsCustom.TextPrimary,
          fontFamily: 'sans',
          fontWeight: FontWeight.w500,
          fontSize: 12.sp,
        ),
        tabs: [
          Tab(text: context.piece),
          Tab(text: context.kilo),
        ],
      ),
    ),
  );
}
