import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/constant/exports_widgets.dart';
import '../../../../features/my_ads/widgets/search_text_field_widget.dart';
import '../controller/document_controller.dart';
import 'list_shimmer_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../features/document/widgets/tap_row_det_widget.dart';

class TabBarMyOfferWidget extends StatefulWidget {
  final DocumentController controller;

  const TabBarMyOfferWidget({super.key, required this.controller});

  @override
  State<TabBarMyOfferWidget> createState() => _TabBarMyOfferWidgetState();
}

class _TabBarMyOfferWidgetState extends State<TabBarMyOfferWidget> {
  late final RefreshController _tabRefreshController;

  @override
  void initState() {
    super.initState();
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
            if (controller.isLoading.value && controller.offersList.isEmpty) {
              return listShimmerWidget();
            }

            if (controller.offersList.isEmpty) {
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
              child: ListView.builder(
                controller: controller.scrollController,
                physics: const BouncingScrollPhysics(),
                itemCount: controller.offersList.length,
                itemBuilder: (context, index) {
                  final item = controller.offersList[index];

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
}
