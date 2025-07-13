import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget TabBarTitleWidget(BuildContext context) {
  return Container(
    height: Width * 0.12,
    width: Width,
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
      ),
      tabs: [
        Tab(text: context.all),
        Tab(text: context.receiveOffers),
        Tab(text: context.underDelivery),
        Tab(text: context.complete),
      ],
    ),
  );
}
