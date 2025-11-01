import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../core/constant/exports_libraries.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../features/document/widgets/tap_row_det_widget.dart';
import '../../../../features/my_ads/widgets/search_text_field_widget.dart';
import '../controller/document_controller.dart';
import 'list_shimmer_widget.dart';

Widget TabBarMyOfferWidget(
  BuildContext context, {
  required DocumentController controller,
}) {
  final RefreshController _refreshController = RefreshController();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
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
            child: controller.isLoading.value && controller.offersList.isEmpty
                ? listShimmerWidget()
                : controller.offersList.isEmpty
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
                : ListView.builder(
                    controller: controller.scrollController,
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.offersList.length,
                    itemBuilder: (context, index) {
                      if (index == controller.offersList.length) {
                        return Center(
                          child: Padding(
                            padding: EdgeInsets.all(20.w),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }

                      final item = controller.offersList[index];

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
                          TapRowDetWidget(context, controller: item.offers!),
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
