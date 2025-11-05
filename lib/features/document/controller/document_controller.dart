// document_controller.dart
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../core/network/utils/api_result.dart';
import '../../../core/network/utils/app_response.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../../home/controller/home_controller.dart';
import 'document_repo.dart';
import '../../../../core/network/models/offers/offers.dart';

class DocumentController extends GetxController {
  static DocumentController get to => Get.find<DocumentController>();

  final DocumentRepo _documentRepo = Get.find<DocumentRepo>();
  final OrderDataController orderDataController = Get.find();
  TextEditingController searchController = TextEditingController();
  RxInt selectedIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxBool isLoadingMore = false.obs;
  RxInt currentPage = 1.obs;
  RxBool hasMorePages = true.obs;
  RxBool isOffline = false.obs;
  RxString searchText = ''.obs;

  RxList<Item> offersList = <Item>[].obs;

  final RefreshController refreshController = RefreshController();
  final ScrollController scrollController = ScrollController();
  final HomeController homeController = Get.find<HomeController>();

  late final tabIndex = homeController.extraTabIndex.value;

  @override
  void onInit() {
    super.onInit();

    tabIndex == 0
        ? orderDataController.setOfferStatus('pending')
        : tabIndex == 1
        ? orderDataController.setOfferStatus('in_progress')
        : orderDataController.setOfferStatus('completed');

    // استماع للاتصال بالإنترنت
    Connectivity().onConnectivityChanged.listen((result) {
      isOffline.value = result == ConnectivityResult.none;
    });

    // إضافة ScrollListener مرة واحدة فقط
    scrollController.addListener(_scrollListener);

    // debounce للبحث
    debounce(
      searchText,
      (_) => refreshOrders(),
      time: Duration(milliseconds: 500),
    );

    // تحميل البيانات أول مرة
    resetControllerState();
    getOffers();
  }

  void _scrollListener() {
    if (scrollController.position.extentAfter < 200) {
      loadMoreOrders();
    }
  }

  void resetControllerState() {
    currentPage.value = 1;
    hasMorePages.value = true;
    offersList.clear();
  }

  Future<void> getOffers() async {
    if (isLoading.value || !hasMorePages.value || isOffline.value) return;
    _setLoading(true);

    final result = await _documentRepo.getOffers(
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

    final result = await _documentRepo.getOffers(
      serviceUuid: orderDataController.serviceUuid.isNotEmpty
          ? '${orderDataController.serviceUuid}'
          : '',
      status: orderDataController.offerStatus.isNotEmpty
          ? '${orderDataController.offerStatus}'
          : '',
      search: searchText.value.isNotEmpty ? searchText.value : null,
      page: currentPage.value,
    );

    if (result is Failure && currentPage.value > 1) currentPage.value--;

    _handleApiResult(result);
    _setLoadingMore(false);
  }

  Future<void> refreshOrders() async {
    if (isLoading.value || isOffline.value) return;

    offersList.clear();
    currentPage.value = 1;
    hasMorePages.value = true;

    _setLoading(true);
    try {
      final result = await _documentRepo.getOffers(
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

  void _handleApiResult(ApiResult<AppResponse> result) {
    if (result is Success<AppResponse>) {
      final response = result.data;
      if (response.data != null) {
        final data = Offers.fromJson(response.data as Map<String, dynamic>);
        final items = data.items ?? [];
        if (items.isNotEmpty) {
          offersList.addAll(items);
          if (items.length < 15) hasMorePages.value = false;
        } else {
          hasMorePages.value = false;
        }
      } else if (!isOffline.value) {
        showSnackbarErrorApi(Get.context!, result.data.errors ?? [], null);
      }
    } else if (result is Failure && !isOffline.value) {
      showSnackbarErrorApi(Get.context!, [], null);
    }
  }

  void changeSelect(int index) => selectedIndex.value = index;

  void _setLoading(bool value) => isLoading.value = value;
  void _setLoadingMore(bool value) => isLoadingMore.value = value;

  @override
  void onClose() {
    scrollController.dispose();
    refreshController.dispose();
    homeController.extraTabIndex.value = 0;
    super.onClose();
    log('DocumentController disposed');
  }
}
