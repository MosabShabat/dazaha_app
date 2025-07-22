import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';

Widget AdsTabBarWidget(BuildContext context) {
  return TabBar(
    // isScrollable: true,
    dividerColor: context.colorsCustom.TextSecondary,
    dividerHeight: 1.h,
    indicatorSize: TabBarIndicatorSize.tab,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(
        color: context.colorsCustom.TealGreenSecondary,
        width: 1,
      ),
    ),
    labelColor: context.colorsCustom.TealGreenSecondary,
    unselectedLabelColor: context.colorsCustom.TextSecondary,
    labelPadding: EdgeInsets.symmetric(horizontal: 0.w),
    labelStyle: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12.sp,
      fontFamily: 'sans',
    ),
    tabs: [
      Tab(text: context.all),
      Tab(text: context.transportationAndDelivery),
      Tab(text: context.buyForMe),
      Tab(text: context.removeAndRecycle),
      Tab(text: context.dedication),
    ],
  );
}
