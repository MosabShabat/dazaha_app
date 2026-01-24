import 'dart:developer';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/network/models/home/latest_order_item_model.dart';
import '../../../core/network/models/orders/order_service_model.dart';
import '../../../core/network/utils/api_result.dart';
import '../../../core/network/utils/app_response.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../../../core/widgets/my_custom_text_field.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import 'all_ads_repo.dart';

class AllAdsController extends GetxController {
  final AllAdsRepo _repo = Get.find<AllAdsRepo>();
  TextEditingController searchController = TextEditingController();
  final OrderDataController orderDataController = Get.find();
  final KeyboardDoneController doneController = KeyboardDoneController();

  RxInt selectedIndex = 0.obs; // بدل int
  RxBool isOffline = false.obs; // <-- اتصال الإنترنت

  RxBool isLoading = false.obs;
  RxBool isLoadingMore = false.obs;
  RxInt currentPage = 1.obs;
  RxBool hasMorePages = true.obs;

  Rx<OrdersSerModel>? ordersModel;
  RxList<LatestOrderItemModel> ordersList = <LatestOrderItemModel>[].obs;

  final ScrollController scrollController = ScrollController();
  RxString searchText = ''.obs;

  RxInt selectedTabIndex = 0.obs;
  RxString offerStatus = ''.obs;

  void setOfferStatus(String status) => offerStatus.value = status;

  @override
  void onInit() {
    super.onInit();
    resetControllerState();
    scrollController.addListener(() {
      if (scrollController.position.extentAfter < 200) {
        getOrdersAll(isLoadMore: true);
      }
    });
    debounce(searchText, (_) {
      refreshOrders();
    }, time: Duration(milliseconds: 500));
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
      search: searchText.value.isNotEmpty ? searchText.value : null,

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

  void changeSelect(int index) {
    selectedIndex.value = index;
  }

  void _processResponse(AppResponse response) {
    if (response.status == true) {
      final model = OrdersSerModel.fromJson(
        response.data as Map<String, dynamic>,
      );

      final newItems = model.items ?? [];

      log("✅ Loaded page: ${currentPage.value}, items: ${newItems.length}");

      if (newItems.isNotEmpty) {
        ordersList.addAll(newItems);

        /// ✅ زيادة الصفحة بعد نجاح جلب البيانات
        currentPage.value++;

        /// ✅ توقف إذا أقل من عدد عناصر الصفحة
        if (newItems.length < 15) hasMorePages.value = false;
      } else {
        hasMorePages.value = false;
      }
    }
  }

  Future<void> loadMoreOrders() async {
    if (isLoadingMore.value || !hasMorePages.value) return;
    if (isOffline.value) return;

    _setLoadingMore(true);
    currentPage.value += 1;

    final result = await _repo.getOrdersAll(
      serviceUuid: orderDataController.serviceUuid.isNotEmpty
          ? '${orderDataController.serviceUuid}'
          : '',
      status: orderDataController.offerStatus.isNotEmpty
          ? '${orderDataController.offerStatus}'
          : '',
      search: searchText.value.isNotEmpty ? searchText.value : null,

      page: currentPage.value,
    );

    if (result is Failure && currentPage.value > 1) currentPage.value -= 1;

    _handleApiResult(result);
    _setLoadingMore(false);
  }

  void _handleApiResult(ApiResult<AppResponse> result) {
    if (result is Success<AppResponse>) {
      final response = result.data;
      if (response.data != null) {
        _processResponse(response);
      } else if (!isOffline.value) {
        showSnackbarErrorApi(Get.context!, response.errors ?? [], null);
      }
    } else if (result is Failure && !isOffline.value) {
      showSnackbarErrorApi(Get.context!, [], null);
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
