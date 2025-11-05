import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../core/widgets/app_snackbar.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../../home/controller/home_controller.dart';
import 'my_ads_repo.dart';
import '../../../core/network/utils/api_result.dart';
import '../../../core/network/utils/app_response.dart';
import '../../../core/network/models/orders/my_orders.dart';

class TransportationAndDeliveryController extends GetxController {
  static TransportationAndDeliveryController get to =>
      Get.find<TransportationAndDeliveryController>();
  final MyAdsRepo _myAdsRepo = Get.find<MyAdsRepo>();

  final OrderDataController orderDataController = Get.find();
  TextEditingController searchController = TextEditingController();
  final RefreshController refreshController = RefreshController();
  RxInt selectedIndex = 0.obs;

  RxBool isLoading = false.obs;
  RxBool isLoadingMore = false.obs;
  RxInt currentPage = 1.obs;
  RxBool hasMorePages = true.obs;
  RxBool isOffline = false.obs; // <-- اتصال الإنترنت
  RxString searchText = ''.obs;

  Rx<MyOrders>? myOrders;
  RxList<ItemMyOrders> ordersList = <ItemMyOrders>[].obs;
  final ScrollController scrollController = ScrollController();

  final HomeController homeController = Get.find<HomeController>();

  late final tabIndex = homeController.extraTabIndex.value;

  @override
  void onInit() {
    super.onInit();

    tabIndex == 0
        ? orderDataController.setOfferStatus('receiving_offers')
        : tabIndex == 1
        ? orderDataController.setOfferStatus('in_progress')
        : orderDataController.setOfferStatus('completed');

    listenConnection();

    scrollController.addListener(_scrollListener);

    debounce(searchText, (_) {
      refreshOrders();
    }, time: Duration(milliseconds: 500));

    resetControllerState();
    getMyOrders();
  }

  // استماع لتغير حالة الإنترنت
  void listenConnection() {
    Connectivity().onConnectivityChanged.listen((result) {
      isOffline.value = result == ConnectivityResult.none;
    });
  }

  void _scrollListener() {
    if (scrollController.position.extentAfter < 200) {
      loadMoreOrders();
    }
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
      search: searchText.value.isNotEmpty ? searchText.value : null,
      page: currentPage.value,
    );

    _handleApiResult(result);
    _setLoading(false);
  }

  Future<void> loadMoreOrders() async {
    if (isLoadingMore.value || !hasMorePages.value || isOffline.value) return;

    _setLoadingMore(true);
    currentPage.value += 1;

    final result = await _myAdsRepo.getMyOrders(
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

  void _processResponse(AppResponse response) {
    if (response.status == true) {
      myOrders = MyOrders.fromJson(response.data as Map<String, dynamic>).obs;
      final List<ItemMyOrders> newItems = myOrders!.value.items ?? [];
      if (newItems.isNotEmpty) {
        ordersList.addAll(newItems);
        if (newItems.length < 15) hasMorePages.value = false;
      } else {
        hasMorePages.value = false;
      }
    } else {
      isLoading.value = false;
    }
  }

  Future<void> refreshOrders() async {
    if (isLoading.value || isOffline.value) return;

    ordersList.clear();
    currentPage.value = 1;
    hasMorePages.value = true;

    _setLoading(true);
    try {
      final result = await _myAdsRepo.getMyOrders(
        serviceUuid: orderDataController.serviceUuid.isNotEmpty
            ? '${orderDataController.serviceUuid}'
            : '',
        status: orderDataController.offerStatus.isNotEmpty
            ? '${orderDataController.offerStatus}'
            : '',
        search: searchText.value.isNotEmpty ? searchText.value : null,
        page: currentPage.value,
      );

      _handleApiResult(result);
    } catch (e) {
      log("RefreshOrders error: $e");
    } finally {
      _setLoading(false);
      // مهم جدًا: تحقق من حالة RefreshController
      if (refreshController.isRefresh) {
        refreshController.refreshCompleted();
      }
    }
  }

  void resetControllerState() {
    currentPage.value = 1;
    hasMorePages.value = true;
    ordersList.clear();
  }

  void _setLoadingMore(bool value) => isLoadingMore.value = value;
  void _setLoading(bool value) => isLoading.value = value;
  void changeSelect(int index) => selectedIndex.value = index;

  @override
  void onClose() {
    scrollController.dispose();
    homeController.extraTabIndex.value = 0;
    refreshController.dispose();
    super.onClose();
    log('TransportationAndDeliveryController disposed');
  }
}
