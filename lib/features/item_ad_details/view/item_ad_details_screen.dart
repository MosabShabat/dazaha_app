import 'dart:developer';

import '../../../core/helpers/constants.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/constant/exports_widgets.dart';
import '../../../core/widgets/bottom_navigation_bar_widget.dart';
import '../../../core/widgets/driver_condition_helper.dart';
import '../../advertisement_summary/widgets/address_widget.dart';
import '../../advertisement_summary/widgets/map_widget.dart';
import '../../advertisement_summary/widgets/time_date_widget.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../../summary/widgets/summary_list_widget.dart';
import '../controller/item_ad_details_controller.dart';
import '../widgets/add_offer_bottom_sheet_widget.dart';
import '../widgets/advertiser_row_widget.dart';
import '../widgets/order_details_shimmer_widget.dart';
import '../widgets/sliver_app_bar_widgets/sliver_app_bar_widget.dart';
import '../widgets/smooth_page_indicator_widget.dart';
import '../widgets/transport_info_widget.dart';

class ItemAdDetailsScreen extends StatelessWidget {
  ItemAdDetailsScreen({super.key});
  final controller = Get.find<ItemAdDetailsController>();
  final orderDataController = Get.find<OrderDataController>();

  @override
  Widget build(BuildContext context) {
    log("AppConstants.isDriver : ${AppConstants.isDriver}");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      orderDataController.clearAll();
    });

    final bool isShow = (Get.arguments as Map?)?['isShow'] ?? false;
    return Obx(() {
      if (controller.isLoading.isTrue)
        return OrderDetailsShimmerWidget(context);
      _setServiceNumber(controller, orderDataController);

      return Scaffold(
        backgroundColor: context.colorsCustom.surfacePrimaryWhite,
        bottomNavigationBar: // الزر السفلي (BottomNavigationBarWidget)
            isShow &&
                controller.orderDetailsItem!.value.myOfferAdded == false &&
                controller.orderDetailsItem!.value.isMe == false
            ? _buildBottomNav(context, controller)
            : const SizedBox.shrink(),
        body: CustomScrollView(
          slivers: [
            // SliverAppBar للصور
            _buildSliverAppBar(context, controller, orderDataController),

            // باقي التفاصيل
            SliverToBoxAdapter(
              child: _buildDetails(
                context,
                controller,
                orderDataController,
                isShow,
              ),
            ),
          ],
        ),
      );
    });
  }

  /// تحديد رقم الخدمة بناءً على serviceUuid
  void _setServiceNumber(
    ItemAdDetailsController controller,
    OrderDataController orderDataController,
  ) {
    final uuid = controller.orderDetailsItem!.value.serviceUuid;
    orderDataController.setServiceUuid(
      '${controller.orderDetailsItem!.value.serviceUuid}',
    );
    orderDataController.setServiceNumber(
      uuid == '69fb5c27-11ef-4637-986f-ed484b388c7f'
          ? '0'
          : uuid == '9cc543c0-793c-43d9-88a6-6e3db6082ef5'
          ? '1'
          : uuid == '7f625412-ca00-431d-a7fd-12863fc851ef'
          ? '2'
          : '3',
    );
  }

  /// SliverAppBar للصور
  Widget _buildSliverAppBar(
    BuildContext context,
    ItemAdDetailsController controller,
    OrderDataController orderDataController,
  ) {
    final item = controller.orderDetailsItem!.value;

    return orderDataController.isItemsService
        ? SliverAppBarWidget(
            context,
            sliController: controller.pageController,
            distance: item.distance ?? '',
            imagesLen: 1,
            imageItem: item.image ?? '',
            type: 1,
            price: '${item.likedPrice ?? ''} ${item.currency ?? ''}',
          )
        : SliverAppBarWidget(
            context,
            sliController: controller.pageController,
            distance: item.distance ?? '',
            imagesLen: item.images?.length ?? 0,
            imageItem: item.images ?? '',
            type: 0,
            price: '${item.likedPrice ?? ''} ${item.currency ?? ''}',
          );
  }

  /// باقي التفاصيل
  Widget _buildDetails(
    BuildContext context,
    ItemAdDetailsController controller,
    OrderDataController orderDataController,
    bool isShow,
  ) {
    final item = controller.orderDetailsItem!.value;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(20.h),

        // مؤشر الصفحات
        if (!orderDataController.isItemsService)
          SmoothPageIndicatorWidget(
            context,
            controller: controller,
            len: item.images?.length ?? 0,
          ),
        verticalSpace(20.h),

        // معلومات النقل
        TransportInfoWidget(
          context,
          title: item.title ?? '',
          description: item.description ?? '',
          serviceName: item.serviceTitle ?? '',
        ),
        verticalSpace(20.h),

        // الوقت والتاريخ
        TimeDateWidget(
          context,
          item.date ?? '',
          item.times?.length ?? 0,
          item.times ?? [],
          orderDataController,
        ),
        verticalSpace(15.h),

        // قائمة العناصر (إذا كانت خدمة نقل)
        if (orderDataController.isItemsService)
          SummaryListWidget(
            context,
            itemsLen: item.items?.length ?? 0,
            itemsDet: item.items ?? [],
          ),
        verticalSpace(20.h),

        // العنوان
        _buildAddressWidget(context, item, orderDataController),
        verticalSpace(20.h),

        // الخريطة
        MapWidget(
          fromAddress: item.fromAddress ?? '',
          fromLat: item.fromLat ?? '',
          fromLng: item.fromLng ?? '',
          toAddress: item.toAddress ?? '',
          toLat: item.toLat ?? '',
          toLng: item.toLng ?? '',
        ),
        verticalSpace(20.h),

        // بيانات المعلن
        if (isShow)
          AdvertiserRowWidget(
            context,
            uuid: item.user?.uuid ?? '',
            image: item.user?.image ?? '',
            name: item.user?.fullName ?? '',
            orderCount: item.user?.ordersCount ?? '',
            rating: item.user?.ratingPercentage ?? '',
          ),
      ],
    ).box.padding(EdgeInsets.symmetric(horizontal: 16.w)).make();
  }

  /// AddressWidget حسب الشروط
  Widget _buildAddressWidget(
    BuildContext context,
    dynamic item,
    OrderDataController orderDataController,
  ) {
    final bool isShowMet =
        orderDataController.isDeliveryService && item.receiptMethod != null;

    return AddressWidget(
      isShow: true,
      isShowMet: isShowMet,
      fromLat: item.fromLat ?? '',
      fromLng: item.fromLng ?? '',
      toLat: item.toLat ?? '',
      toLng: item.toLng ?? '',
      from: item.from ?? '',
      fromAddress: item.fromAddress ?? '',
      toAddress: item.toAddress ?? '',
      to: item.to ?? '',
      receiptMethodImage: item.receiptMethod?.image ?? '',
      receiptMethodTitle: item.receiptMethod?.title ?? '',
      receiptMethodDec: item.receiptMethod?.description ?? '',
      sizeTitle: item.size?.title ?? '',
      sizeImg: item.size?.image ?? '',
      helpers: orderDataController.isItemsService
          ? '0'
          : ('${item.helpers ?? ''}'),
      orderDataController: orderDataController,
    );
  }

  Widget _buildBottomNav(
    BuildContext context,
    ItemAdDetailsController controller,
  ) {
    final item = controller.orderDetailsItem!.value;
    final orderDataController = Get.find<OrderDataController>();

    return AppConstants.isDriver == '1' || AppConstants.isDriver == 1
        ? BottomNavigationBarWidget(
            text: context.addAnOffer,
            context,
            GetScreen: () {
              DriverConditionHelper.handleDriverCondition(
                context: context,
                orderDataController: orderDataController,
                onDriverActive: () {
                  AddOfferBottomSheetWidget(
                    context,
                    price: item.likedPrice,
                    curr: item.currency!,
                    timeLen: item.times?.length ?? 0,
                    timeItem: item.times ?? [],
                    isUpdate: false,
                  );
                },
              );
            },
          )
        : SizedBox.shrink();
  }
}
