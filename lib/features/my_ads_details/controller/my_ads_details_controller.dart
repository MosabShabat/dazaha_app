import '../../../core/constant/exports_widgets.dart';

import '../../../core/constant/exports_libraries.dart';
import '../../../core/network/utils/api_result.dart';

import '../../../core/helpers/constants.dart';
import '../../../core/network/models/orders/my_order_details.dart';
import '../../../core/network/utils/app_response.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../../../core/widgets/app_snackbar_with_button.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import 'my_ads_details_repo.dart';

class MyAdsDetailsController extends GetxController {
  final MyAdsDetailsRepo _myOrderDetailsRepo = Get.find<MyAdsDetailsRepo>();
  final OrderDataController _orderDataController = Get.find();
  final KeyboardDoneController doneController = KeyboardDoneController();

  var selectedIndex = 0.obs;
  RxBool isLoading = true.obs;
  RxBool isOffersLoading = true.obs;
  RxList<Offer> offersList = <Offer>[].obs;
  var isLoadingDelete = false.obs;

  Rx<MyOrderDetails>? myOrderDetails;

  @override
  void onInit() {
    super.onInit();
    offersList.clear();
    AppConstants.orderUuid = _orderDataController.itemUuid.value;
    getMyOrderDetails();
    getMyOrderOffers("created_at");
  }

  void getMyOrderDetails() async {
    isLoading.value = true;
    final result = await _myOrderDetailsRepo.getMyOrders();
    result.when(
      success: (response) {
        isLoading.value = false;
        if (response.status == true) {
          if (response.data != null) {
            myOrderDetails = MyOrderDetails.fromJson(response.data).obs;
          } else {
            showSnackbarErrorApi(Get.context!, response.errors ?? [], null);
          }
        } else {
          isLoading.value = false;
          showErrorSnackbar(
            Get.context!,
            response.message ?? '',
            FirstColor: Colors.red,
          );
        }
      },
      failure: (error) {
        isLoading.value = false;
        showSnackbarErrorApi(Get.context!, [error], null);
      },
    );
  }

  void deleteOrder() async {
    _setLoadingDelete(true);
    final result = await _myOrderDetailsRepo.deleteOrder();
    _handleResult(
      result,
      onSuccess: (response) {
        if (response.status == true) {
          _setLoadingDelete(false);
          showSnackbarWithButton(
            Get.context!,
            Get.context!.successful,
            AppConstants.success,
            showButton: false,
          );
        } else {
          showErrorSnackbar(
            Get.context!,
            response.message ?? '',
            FirstColor: Colors.red,
          );
        }
      },
    );
  }

  void _handleResult(
    dynamic result, {
    required Function(AppResponse) onSuccess,
  }) {
    if (result is Success<AppResponse>) {
      _setLoading(false);
      _setLoadingDelete(false);
      onSuccess(result.data);
    } else if (result is Failure) {
      _setLoading(false);
      _setLoadingDelete(false);
      showSnackbarErrorApi(Get.context!, [result.error], null);
    }
  }

  void getMyOrderOffers(String orderBy) async {
    isOffersLoading.value = true;
    final result = await _myOrderDetailsRepo.getMyOrderOffers(orderBy);
    result.when(
      success: (response) {
        isOffersLoading.value = false;
        if (response.status == true && response.data != null) {
          final List items = response.data['items'] ?? [];
          offersList.value = items.map((e) => Offer.fromJson(e)).toList();
        } else {
          isLoading.value = false;
          showErrorSnackbar(
            Get.context!,
            response.message ?? '',
            FirstColor: Colors.red,
          );
        }
      },
      failure: (error) {
        isOffersLoading.value = false;
        showSnackbarErrorApi(Get.context!, [error], null);
      },
    );
  }

  void changeSelect(int index) {
    selectedIndex.value = index;
    switch (index) {
      case 0:
        getMyOrderOffers("created_at");
        break;
      case 1:
        getMyOrderOffers("price");
        break;
      case 2:
        getMyOrderOffers("rate");
        break;
    }
  }

  _setLoadingDelete(bool value) {
    isLoadingDelete.value = value;
  }

  void _setLoading(bool value) {
    isLoading.value = value;
  }

  @override
  void onClose() {
    offersList.clear();
    offersList.close();
    super.onClose();
  }
}
