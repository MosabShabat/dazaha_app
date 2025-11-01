import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import 'document_repo.dart';
import '../../../core/network/utils/api_result.dart';
import '../../../core/network/utils/app_response.dart';
import '../../../../core/network/models/offers/offers.dart';

class DocumentController extends GetxController {
  RxInt selectedIndex = 0.obs;

  final DocumentRepo _documentRepo = Get.find<DocumentRepo>();
  TextEditingController searchController = TextEditingController();
  final OrderDataController orderDataController = Get.find();

  RxBool isLoading = false.obs;
  RxBool isLoadingMore = false.obs;
  RxInt currentPage = 1.obs;
  RxBool hasMorePages = true.obs;
  RxBool isOffline = false.obs; // <-- اتصال الإنترنت
  RxString searchText = ''.obs;

  Rx<Offers>? offer;
  RxList<Item> offersList = <Item>[].obs;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    listenConnection();
    resetControllerState();
    getOffers();

    scrollController.addListener(() {
      if (scrollController.position.extentAfter < 200) {
        loadMoreOrdersModel();
      }
    });
    debounce(searchText, (_) {
      refreshOrders();
    }, time: Duration(milliseconds: 500));
  }

  void listenConnection() {
    Connectivity().onConnectivityChanged.listen((result) {
      isOffline.value = result == ConnectivityResult.none;
    });
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

  Future<void> loadMoreOrdersModel() async {
    if (isLoadingMore.value || !hasMorePages.value || isOffline.value) return;
    _setLoadingMore(true);

    final result = await _documentRepo.getOffers(
      page: currentPage.value,
      serviceUuid: orderDataController.serviceUuid.isNotEmpty
          ? '${orderDataController.serviceUuid}'
          : '',
      status: orderDataController.offerStatus.isNotEmpty
          ? '${orderDataController.offerStatus}'
          : '',
      search: searchText.value.isNotEmpty ? searchText.value : null,
    );

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
      final data = Offers.fromJson(response.data as Map<String, dynamic>);
      final List<Item> newItems = data.items ?? [];
      if (newItems.isNotEmpty) {
        offersList.addAll(newItems);
        currentPage.value++;
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

    final result = await _documentRepo.getOffers(
      serviceUuid: orderDataController.serviceUuid.isNotEmpty
          ? '${orderDataController.serviceUuid}'
          : '',
      status: orderDataController.offerStatus.isNotEmpty
          ? '${orderDataController.offerStatus}'
          : '',
      search: searchController.text.isNotEmpty ? searchController.text : null,
      page: currentPage.value,
    );

    if (result is Failure && currentPage.value > 1) currentPage.value -= 1;

    _handleApiResult(result);
    _setLoadingMore(false);
  }

  Future<void> refreshOrders() async {
    if (isOffline.value) return;
    offersList.clear();
    currentPage.value = 1;
    hasMorePages.value = true;
    await getOffers();
  }

  void resetControllerState() {
    currentPage.value = 1;
    hasMorePages.value = true;
  }

  void _setLoadingMore(bool value) => isLoadingMore.value = value;
  void _setLoading(bool value) => isLoading.value = value;
  void changeSelect(int index) => selectedIndex.value = index;

  @override
  void dispose() {
    orderDataController.clearAll();
    orderDataController.setOfferStatus('');
    Get.delete<DocumentController>();
    super.dispose();
    log('DocumentController disposed');
  }
}
