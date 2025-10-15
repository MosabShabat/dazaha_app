import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/helpers/app_shared_methods.dart';
import '../../../core/widgets/def_app_bar_widget.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../controller/all_ads_controller.dart';
import '../widgets/ads_tab_bar_widget.dart';
import '../widgets/body_ads_tap_bar_widget.dart';

class AllAdsScreen extends StatelessWidget {
  AllAdsScreen({super.key});

  final AllAdsController _allAdsController = Get.find();
  final OrderDataController _orderDataController = Get.find();
  final RefreshController _refreshController = RefreshController();

  final Map<int, String> _serviceUuidMap = {
    0: '',
    1: '?service_uuid=69fb5c27-11ef-4637-986f-ed484b388c7f',
    2: '?service_uuid=9cc543c0-793c-43d9-88a6-6e3db6082ef5',
    3: '?service_uuid=7f625412-ca00-431d-a7fd-12863fc851ef',
    4: '?service_uuid=153a7042-eb9e-42b8-9d5c-498623adb5da',
  };

  void _setupScrollListener() {
    _allAdsController.scrollController.addListener(() {
      if (_allAdsController.scrollController.position.extentAfter < 200) {
        _allAdsController.getOrdersAll(isLoadMore: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final int initialTabIndex = (Get.arguments?['index'] ?? 0).clamp(0, 4);
    _orderDataController.setOfferStatus(_serviceUuidMap[initialTabIndex] ?? '');
    _allAdsController.resetControllerState();
    _allAdsController.getOrdersAll();
    _setupScrollListener();

    return DefaultTabController(
      initialIndex: initialTabIndex,
      length: _serviceUuidMap.length,
      child: Builder(
        builder: (context) {
          final tabController = DefaultTabController.of(context);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            tabController.addListener(() {
              if (!tabController.indexIsChanging) {
                final selectedUuid = _serviceUuidMap[tabController.index] ?? '';
                _orderDataController.setOfferStatus(selectedUuid);
                _allAdsController.refreshOrders();
              }
            });
          });

          return Scaffold(
            backgroundColor: context.colorsCustom.surfacePrimaryWhite,
            appBar: DefAppBarWidget(context),
            body: SafeArea(
              child: SmartRefresher(
                controller: _refreshController,
                onRefresh: () async {
                  await _allAdsController.refreshOrders();
                  _refreshController.refreshCompleted();
                },
                header: CustomHeader(
                  builder: (context, status) => SizedBox(
                    height: 60.h,
                    child: Center(
                      child: AppSharedMethods.buildProgressViewWhite(
                        context,
                        false,
                      ),
                    ),
                  ),
                ),
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
                    Expanded(
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(
                          _serviceUuidMap.length,
                          (index) => BodyAdsTapBarWidget(
                            context,
                            controller: _allAdsController,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
