import '../../../core/constant/exports_libraries.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../document/widgets/list_shimmer_widget.dart';
import '../controller/transportation_and_delivery_controller.dart';
import '../../../../features/my_ads/widgets/row_det_cas_widget.dart';
import '../../../../features/my_ads/widgets/search_text_field_widget.dart';

class BodyTabBarWidget extends StatefulWidget {
  final TransportationAndDeliveryController controller;

  const BodyTabBarWidget({super.key, required this.controller});

  @override
  State<BodyTabBarWidget> createState() => _BodyTabBarWidgetState();
}

class _BodyTabBarWidgetState extends State<BodyTabBarWidget> {
  late final RefreshController _tabRefreshController;

  @override
  void initState() {
    super.initState();
    // لكل تبويب RefreshController مستقل
    _tabRefreshController = RefreshController();
  }

  @override
  void dispose() {
    _tabRefreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;

    return Column(
      children: [
        verticalSpace(20.h),
        SearchTextFieldWidget(
          context,
          controller: controller.searchController,
          onChanged: (value) => controller.searchText.value = value,
          onSubmitted: (_) => controller.refreshOrders(),
        ),
        verticalSpace(20.h),
        Expanded(
          child: Obx(() {
            if (controller.isLoading.value && controller.ordersList.isEmpty) {
              return listShimmerWidget();
            }

            if (controller.ordersList.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      AppAssets.json.process_json,
                      width: 101.w,
                      height: 101.w,
                    ),
                    verticalSpace(20.h),
                    Text(
                      context.dataEmpty,
                      textAlign: TextAlign.center,
                      style: context.textStyles.titleLarge.bold.copyWith(
                        color: context.colorsCustom.surfacePrimaryBlack,
                      ),
                    ),
                  ],
                ),
              );
            }

            return SmartRefresher(
              controller: _tabRefreshController,
              enablePullUp: true,
              onRefresh: () async {
                await controller.refreshOrders();
                _tabRefreshController.refreshCompleted();
              },
              onLoading: () async {
                await controller.loadMoreOrders();
                _tabRefreshController.loadComplete();
              },
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.ordersList.length,
                separatorBuilder: (_, __) => verticalSpace(20.h),
                itemBuilder: (_, index) {
                  final item = controller.ordersList[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.date ?? '',
                        style: context.textStyles.headlineSmall.medium.copyWith(
                          color: context.colorsCustom.TextPrimary,
                          fontSize: 16.sp,
                        ),
                      ),
                      verticalSpace(20.h),
                      RowDetCasWidget(context, controller: item.orders!),
                    ],
                  );
                },
              ),
            );
          }),
        ),
      ],
    );
  }
}
