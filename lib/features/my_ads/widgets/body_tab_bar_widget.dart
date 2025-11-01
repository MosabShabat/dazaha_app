import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../features/my_ads/widgets/row_det_cas_widget.dart';
import '../../../../features/my_ads/widgets/search_text_field_widget.dart';
import '../../document/widgets/list_shimmer_widget.dart';
import '../controller/transportation_and_delivery_controller.dart';

Widget BodyTabBarWidget(
  BuildContext context, {
  required TransportationAndDeliveryController controller,
}) {
  final RefreshController _refreshController = RefreshController();

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
          return SmartRefresher(
            controller: _refreshController,
            enablePullUp: true,
            onRefresh: () async {
              await controller.refreshOrders();
              _refreshController.refreshCompleted();
            },
            onLoading: () async {
              await controller.loadMoreOrders();
              _refreshController.loadComplete();
            },
            child: controller.isLoading.value && controller.ordersList.isEmpty
                ? listShimmerWidget()
                : controller.ordersList.isEmpty
                ? Center(
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
                  )
                : ListView.separated(
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
                            style: context.textStyles.headlineSmall.medium
                                .copyWith(
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
