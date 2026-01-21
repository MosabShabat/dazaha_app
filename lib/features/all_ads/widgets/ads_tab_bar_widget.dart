import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/helpers/constants.dart';

Widget AdsTabBarWidget(BuildContext context) {
  final tabs = [
    context.all,
    AppConstants.transportationAndDelivery,
    AppConstants.buyForMe,
    AppConstants.removal,
    AppConstants.dedication,
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
    tabs: tabs.map((text) => Tab(child: Text(text))).toList(),
  );
}
