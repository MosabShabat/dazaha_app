import '../../../core/network/utils/api_result.dart';
import 'package:get/get.dart';

import '../../../core/helpers/constants.dart';
import '../../../core/network/models/orders/my_order_details.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import 'my_ads_details_repo.dart';

class MyAdsDetailsController extends GetxController {
  final MyAdsDetailsRepo _myOrderDetailsRepo = Get.find<MyAdsDetailsRepo>();
  final OrderDataController _orderDataController = Get.find();

  var selectedIndex = 0.obs;
  RxBool isLoading = true.obs;
  RxBool isOffersLoading = true.obs;
  RxList<Offer> offersList = <Offer>[].obs;

  Rx<MyOrderDetails>? myOrderDetails;

  @override
  void onInit() {
    super.onInit();
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
          showErrorSnackbar(Get.context!, response.message ?? '');
        }
      },
      failure: (error) {
        isLoading.value = false;
        showSnackbarErrorApi(Get.context!, [error], null);
      },
    );
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
          showErrorSnackbar(Get.context!, response.message ?? '');
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
}
