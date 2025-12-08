import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';

Widget AdsTabBarWidget(BuildContext context) {
  final tabs = [
    context.all,
    context.transportationAndDelivery,
    context.buyForMe,
    context.removeAndRecycle,
    context.dedication,
  ];

  return TabBar(
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(
        color: context.colorsCustom.TealGreenSecondary,
        width: 1,
      ),
    ),
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: context.colorsCustom.TealGreenSecondary,
    unselectedLabelColor: context.colorsCustom.TextSecondary,
    labelPadding: EdgeInsets.symmetric(horizontal: 0.w),
    labelStyle: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12.sp,
      fontFamily: 'Tajawal',
    ),
    tabs: tabs.map((text) => Tab(text: text)).toList(),
  );
}
