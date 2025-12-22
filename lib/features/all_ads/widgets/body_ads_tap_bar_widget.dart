import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/widgets/handle_ads_tap.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../controller/all_ads_controller.dart';
import 'ser_row_widget.dart';
import 'shadow_con_widget.dart';
import 'shimmer_grid_view_widget.dart';

Widget BodyAdsTapBarWidget(
  BuildContext context, {
  required AllAdsController controller,
}) {
  final OrderDataController orderDataController = Get.find();
  final RefreshController _refreshController = RefreshController();

  return Padding(
    padding: EdgeInsets.only(top: 20.h, left: 16.w, right: 16.w),
    child: Column(
      children: [
        SerRowWidget(context, controller: controller),
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
                  ? ShimmerGridViewWidget()
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
                  : GridView.builder(
                      controller: controller.scrollController,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.ordersList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20.w,
                        mainAxisSpacing: 20.h,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (_, index) {
                        final item = controller.ordersList[index];

                        return GestureDetector(
                          onTap: () {
                            handleAdsTap(
                              context,
                              isHomePage: false,
                              onNavigate: () {
                                // 👈 هنا يمكنك تغيير ماذا يحدث عند الضغط
                                orderDataController.setItemUuid(
                                  item.uuid ?? '',
                                );
                                Get.toNamed(
                                  Routes.itemAdDetailsScreen,
                                  arguments: {'isShow': true},
                                );
                              },
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                  item.image ?? '',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: ShadowConWidget(
                              context,
                              title: item.title ?? '',
                              price:
                                  '${item.likedPrice ?? ''} ${item.currency ?? ''}',
                              imageUrl: item.serviceImage ?? '',
                            ),
                          ),
                        );
                      },
                    ),
            );
          }),
        ),
        verticalSpace(20.h),
      ],
    ),
  );
}
