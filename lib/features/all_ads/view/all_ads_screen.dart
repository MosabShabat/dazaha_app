import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:dazaha_app/core/constant/exports_widgets.dart';
import 'package:dazaha_app/core/widgets/def_app_bar_widget.dart';
import 'package:dazaha_app/features/all_ads/widgets/ads_tab_bar_widget.dart';
import 'package:dazaha_app/features/all_ads/widgets/body_ads_tap_bar_widget.dart';

class AllAdsScreen extends StatelessWidget {
  const AllAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = Get.arguments ?? {};
    final int initialTabIndex = args['index'] ?? 0;

    return Scaffold(
      backgroundColor: context.colorsCustom.surfacePrimaryWhite,
      appBar: DefAppBarWidget(context),
      body: SafeArea(
        child: DefaultTabController(
          length: 5,
          initialIndex: initialTabIndex.clamp(0, 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.latestAnnouncements,
                style: context.textStyles.bodyLarge.bold.copyWith(
                  color: context.colorsCustom.TextPrimary,
                  fontSize: 20.sp,
                ),
              ).paddingSymmetric(horizontal: 16.w),
              verticalSpace(10.h),
              AdsTabBarWidget(context),
              Flexible(
                child: TabBarView(
                  children: List.generate(
                    5,
                    (index) => BodyAdsTapBarWidget(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
