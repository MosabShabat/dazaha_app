import 'dart:developer';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/network/models/home/latest_order_item_model.dart';
import '../../../core/network/models/orders/order_service_model.dart';
import '../../../core/network/utils/api_result.dart';
import '../../../core/network/utils/app_response.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import 'all_ads_repo.dart';

class AllAdsController extends GetxController {
  final AllAdsRepo _repo = Get.find<AllAdsRepo>();
  TextEditingController searchController = TextEditingController();
  final OrderDataController orderDataController = Get.find();

  RxBool isLoading = false.obs;
  RxBool isLoadingMore = false.obs;
  RxInt currentPage = 1.obs;
  RxBool hasMorePages = true.obs;

  Rx<OrdersSerModel>? ordersModel;
  RxList<LatestOrderItemModel> ordersList = <LatestOrderItemModel>[].obs;

  final ScrollController scrollController = ScrollController();

  RxInt selectedTabIndex = 0.obs;
  RxString offerStatus = ''.obs;

  void setOfferStatus(String status) => offerStatus.value = status;

  @override
  void onInit() {
    super.onInit();
    resetControllerState();
  }

  Future<void> getOrdersAll({bool isLoadMore = false}) async {
    if ((isLoadMore ? isLoadingMore.value : isLoading.value) ||
        !hasMorePages.value)
      return;

    isLoadMore ? _setLoadingMore(true) : _setLoading(true);

    final result = await _repo.getOrdersAll(
      serviceUuid: orderDataController.serviceUuid.isNotEmpty
          ? '${orderDataController.serviceUuid}'
          : '',
      status: orderDataController.offerStatus.isNotEmpty
          ? '${orderDataController.offerStatus}'
          : '',
      search: searchController.text.isNotEmpty ? searchController.text : null,
      page: currentPage.value,
    );

    if (result is Success<AppResponse>) {
      final response = result.data;
      if (response.data != null) {
        _processResponse(response);
      } else {
        showSnackbarErrorApi(Get.context!, response.errors ?? [], null);
      }
    } else {
      showSnackbarErrorApi(Get.context!, [], null);
    }

    isLoadMore ? _setLoadingMore(false) : _setLoading(false);
  }

  void _processResponse(AppResponse response) {
    log("Processing response");
    if (response.status != true) return;

    ordersModel = OrdersSerModel.fromJson(
      response.data as Map<String, dynamic>,
    ).obs;
    final newItems = ordersModel!.value.items ?? [];

    if (newItems.isNotEmpty) {
      ordersList.addAll(newItems);
      currentPage.value += 1;
      if (newItems.length < 15) hasMorePages.value = false;
      log("Loaded orders: ${newItems.length}");
    } else {
      hasMorePages.value = false;
    }
  }

  Future<void> refreshOrders() async {
    resetControllerState();
    await getOrdersAll();
  }

  void resetControllerState() {
    currentPage.value = 1;
    hasMorePages.value = true;
    ordersList.clear();
  }

  void _setLoading(bool value) => isLoading.value = value;
  void _setLoadingMore(bool value) => isLoadingMore.value = value;

  @override
  void dispose() {
    Get.delete<AllAdsController>();
    super.dispose();
    log('AllAdsController disposed');
  }
}
