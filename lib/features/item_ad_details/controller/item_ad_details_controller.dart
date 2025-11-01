import 'package:dazaha_app/core/constant/exports_widgets.dart';

import '../../../../core/helpers/constants.dart';

import '../../../core/network/utils/api_error_model.dart';
import '../../../core/network/utils/api_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/network/models/orders/order_details_item.dart';
import '../../../core/network/utils/app_response.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../widgets/my_offer_to_customer_widget.dart';
import 'item_ad_details_repo.dart';

class ItemAdDetailsController extends GetxController {
  final currentPage = 0.obs;
  final ItemAdDetailsRepo _itemAdDetailsRepo = Get.find<ItemAdDetailsRepo>();
  final OrderDataController _orderDataController = Get.find();
  RxBool isLoading = true.obs;
  Rx<OrdersDetailsItem>? orderDetailsItem;

  final TextEditingController priceController = TextEditingController();
  RxBool isButtonPressed = false.obs;
//0598280909
  var selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pageController.addListener(() {
      final newPage = pageController.page?.round() ?? 0;
      if (currentPage.value != newPage) {
        currentPage.value = newPage;
      }
    });
    // _orderDataController.setItemUuid(_orderDataController.itemUuid.value);
    AppConstants.orderUuid = _orderDataController.itemUuid.value;
    getOrderDetails();
  }

  void getOrderDetails() async {
    isLoading.value = true;
    final result = await _itemAdDetailsRepo.getOrderDetails();
    result.when(
      success: (response) {
        isLoading.value = false;
        if (response.status == true) {
          if (response.data != null && response.data is Map<String, dynamic>) {
            orderDetailsItem = OrdersDetailsItem.fromJson(response.data).obs;
          }
          // if (response.data != null) {
          //   orderDetailsItem = OrdersDetailsItem.fromJson(
          //     response.data as Map<String, dynamic>,
          //   ).obs;
          // }
          else {
            showSnackbarErrorApi(Get.context!, response.errors ?? [], null);
          }
        } else {
          isLoading.value = false;
          showErrorSnackbar(Get.context!, response.message ?? '',FirstColor: Colors.red);
        }
      },
      failure: (error) {
        isLoading.value = false;
        showSnackbarErrorApi(Get.context!, [error], null);
      },
    );
  }

  final PageController pageController = PageController();

  void changeSelect(int index) {
    selectedIndex.value = index;
  }

  void validationInputData(BuildContext context) {
    if (priceController.text.isEmpty) {
      showErrorSnackbar(context, context.enterAmount,FirstColor: Colors.amber);
      return;
    }
    _orderDataController.setLikedPrice(priceController.text);
    _orderDataController.setTimeUuid(_orderDataController.timeUuid.value);

    AddOffer(context);
  }

  void AddOffer(BuildContext context) async {
    _setButtonPressed(true);
    try {
      final result = await _itemAdDetailsRepo.AddOffer();
      _handleOrderResponse(result);
    } catch (e) {
      _setButtonPressed(false);
      showErrorSnackbar(context, context.error, FirstColor: Colors.red);
    }
  }

  void _handleOrderResponse(ApiResult<AppResponse> result) {
    result.when(
      success: (response) {
        _setButtonPressed(false);
        if (response.status == true) {
          Get.back();
          MyOfferToCustomerWidget(
            Get.context!,
            IsShowRow: true,
            title: '1',
            onTap: () {
              // orderDataController.clearAll();
              Get.offAllNamed(
                Routes.homeScreen,
                arguments: {'selectedIndex': 3},
              );
            },
          );
        } else {
          showErrorSnackbar(
            Get.context!,
            response.message ?? '',
            FirstColor: Colors.red,
          );
        }
      },
      failure: (error) {
        _setButtonPressed(false);
        _showApiErrors([error]);
      },
    );
  }

  void _showApiErrors(List<ApiErrorModel> errors) {
    showSnackbarErrorApi(Get.context!, errors, null);
  }

  void _setButtonPressed(bool value) => isButtonPressed.value = value;

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
