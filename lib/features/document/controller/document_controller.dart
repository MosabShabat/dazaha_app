import 'dart:developer';
import '../../../../core/network/models/offers/offers.dart';
import '../../../../core/network/utils/api_result.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/network/utils/app_response.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import 'document_repo.dart';

class DocumentController extends GetxController {
  var selectedIndex = 0.obs;

  final DocumentRepo _documentRepo = Get.find<DocumentRepo>();
  TextEditingController searchController = TextEditingController();
  final OrderDataController orderDataController = Get.find();

  void changeSelect(int index) {
    selectedIndex.value = index;
  }
  //Offers

  RxBool isLoading = false.obs;
  RxBool isLoadingMore = false.obs;
  RxInt currentPage = 1.obs;
  RxBool hasMorePages = true.obs;

  Rx<Offers>? offer;
  RxList<Item> offersList = <Item>[].obs;
  final ScrollController scrollController = ScrollController();
  var initialized = false;

  @override
  void onInit() {
    super.onInit();
    resetControllerState();
    getOffers();
  }

  Future<void> getOffers() async {
    if (isLoading.value || !hasMorePages.value) return;
    _setLoading(true);
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

  Future<void> loadMoreOrdersModel() async {
    if (isLoadingMore.value || !hasMorePages.value) return;
    _setLoadingMore(true);

    final result = await _documentRepo.getOffers(
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

  void _processResponse(AppResponse response) {
    log("response1");
    if (response.status == true) {
      offer = Offers.fromJson(response.data as Map<String, dynamic>).obs;

      final List<Item> newItems = offer!.value.items ?? [];

      if (newItems.isNotEmpty) {
        log("Loaded orders: ${newItems.length}");
        offersList.addAll(newItems);
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

  Future<void> refreshOrders() async {
    offersList.clear();
    currentPage.value = 1;
    hasMorePages.value = true;
    await getOffers();
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

  @override
  void dispose() {
    orderDataController.clearAll();
    orderDataController.setOfferStatus('');
    Get.delete<DocumentController>();
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
