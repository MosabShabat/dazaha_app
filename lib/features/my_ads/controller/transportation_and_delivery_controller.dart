import 'dart:developer';

import '../../../../core/network/utils/api_result.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/network/models/orders/my_orders.dart';
import '../../../core/network/utils/app_response.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import 'my_ads_repo.dart';

class TransportationAndDeliveryController extends GetxController {
  RxInt selectedIndex = 0.obs; // بدل int

  final OrderDataController orderDataController = Get.find();
  TextEditingController searchController = TextEditingController();
  final MyAdsRepo _myAdsRepo = Get.find<MyAdsRepo>();

  RxBool isLoading = false.obs;
  RxBool isLoadingMore = false.obs;
  RxInt currentPage = 1.obs;
  RxBool hasMorePages = true.obs;

  Rx<MyOrders>? myOrders;
  RxList<ItemMyOrders> ordersList = <ItemMyOrders>[].obs;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    orderDataController.clearAll();
    resetControllerState();
    getMyOrders();
  }

  Future<void> getMyOrders() async {
    if (isLoading.value || !hasMorePages.value) return;
    _setLoading(true);
    final result = await _myAdsRepo.getMyOrders(
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
    } else if (result is Failure) {
      showSnackbarErrorApi(Get.context!, [], null);
    }

    _setLoading(false);
  }

  void _processResponse(AppResponse response) {
    log("response1");
    if (response.status == true) {
      myOrders = MyOrders.fromJson(response.data as Map<String, dynamic>).obs;

      final List<ItemMyOrders> newItems = myOrders!.value.items ?? [];

      if (newItems.isNotEmpty) {
        log("Loaded orders: ${newItems.length}");
        ordersList.addAll(newItems);
        currentPage.value += 1;

        if (newItems.length < 15) {
          hasMorePages.value = false;
        }
      } else {
        hasMorePages.value = false;
      }
    } else {
      isLoading.value = false;
    }
  }

  Future<void> loadMoreOrdersModel() async {
    if (isLoadingMore.value || !hasMorePages.value) return;
    _setLoadingMore(true);

    final result = await _myAdsRepo.getMyOrders(
      page: currentPage.value,
      serviceUuid: orderDataController.serviceUuid.isNotEmpty
          ? '${orderDataController.serviceUuid}'
          : '',
      status: orderDataController.offerStatus.isNotEmpty
          ? '${orderDataController.offerStatus}'
          : '',
      search: searchController.text.isNotEmpty ? searchController.text : null,
    );

    if (result is Success<AppResponse>) {
      final response = result.data;
      if (response.data != null) {
        _processResponse(response);
      } else {
        showSnackbarErrorApi(Get.context!, response.errors ?? [], null);
      }
    } else if (result is Failure) {
      showSnackbarErrorApi(Get.context!, [], null);
    }

    _setLoadingMore(false);
  }

  Future<void> refreshOrders() async {
    ordersList.clear();
    currentPage.value = 1;
    hasMorePages.value = true;
    await getMyOrders();
  }

  void resetControllerState() {
    currentPage.value = 1;
    hasMorePages.value = true;
  }

  void _setLoadingMore(bool value) {
    isLoadingMore.value = value;
  }

  void _setLoading(bool value) {
    isLoading.value = value;
  }

  void changeSelect(int index) {
    selectedIndex.value = index;
  }

  @override
  void dispose() {
    orderDataController.clearAll();
    orderDataController.setOfferStatus('');
    Get.delete<TransportationAndDeliveryController>();
    super.dispose();
    log('AllAdsController disposed: dispose');
  }

  @override
  void onClose() {
    orderDataController.clearAll();
    orderDataController.setOfferStatus('');
    super.onClose();
    log('AllAdsController disposed: onClose');
  }
}
