import '../../../core/constant/exports_widgets.dart';
import '../../../core/network/utils/api_result.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/network/models/cart/bill_item.dart';
import '../../../core/network/models/cart/order_payment_model.dart';
import '../../../core/network/utils/app_response.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import 'my_ad_pay_ment_repo.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MyAdPayMentController extends GetxController {
  final MyAdPayMentRepo _repo = Get.find();
  final OrderDataController _orderDataController = Get.find();

  final TextEditingController couponCodeController = TextEditingController();

  // UI States
  RxBool isLoading = false.obs;
  RxBool isButtonPressed = false.obs;
  RxBool isLoadingCoupon = false.obs;
  RxBool isDisabledCoupon = true.obs;

  // Payment Data
  RxList<BillItem> billList = <BillItem>[].obs;
  RxString totalPrice = '0.0'.obs;
  RxString currency = Get.context!.currency.obs;

  RxInt selectedIndex = 0.obs;
  void changeSelect(int index) => selectedIndex.value = index;

  OrderPaymentModel? orderPaymentModel;

  @override
  void onInit() {
    super.onInit();
    _orderDataController.likedPrice.value = couponCodeController.text;
    _fetchPayment(couponCodeController.text, 'false');
  }

  // Validate coupon input
  void validateInput(BuildContext context) {
    if (couponCodeController.text.trim().isEmpty) {
      showErrorSnackbar(context, context.enterCouponHere);
      return;
    }
    _fetchPayment(couponCodeController.text, AppConstants.coupon);
  }

  Future<void> _fetchPayment(String? couponCode, String type) async {
    _setLoading(type, true);

    final result = await _repo.getPayMent(couponCode);

    result.when(
      success: (response) {
        _setLoading(type, false);
        if (response.status == true && response.data != null) {
          _updatePaymentModel(response, couponCode);
        } else {
          showErrorSnackbar(Get.context!, response.message ?? '');
        }
      },
      failure: (error) {
        _setLoading(type, false);
        showSnackbarErrorApi(Get.context!, [error], null);
      },
    );
  }

  void _updatePaymentModel(AppResponse response, String? couponCode) {
    orderPaymentModel = OrderPaymentModel.fromJson(
      response.data as Map<String, dynamic>,
    );
    billList.value = orderPaymentModel!.bill;
    totalPrice.value = orderPaymentModel!.total;
    currency.value = orderPaymentModel!.currency;

    isDisabledCoupon.value = couponCode == null || couponCode.isEmpty;
  }

  void _setLoading(String type, bool value) {
    if (type == AppConstants.coupon) {
      isLoadingCoupon.value = value;
    } else {
      isLoading.value = value;
    }
  }

  // Execute Payment
  Future<void> executeOrder(
    BuildContext context, {
    required String paymentWayUuid,
    String? couponCode,
  }) async {
    isButtonPressed.value = true;

    final result = await _repo.executeOrder(
      paymentWayUuid: paymentWayUuid,
      couponCode: couponCode,
    );

    result.when(
      success: (response) {
        isButtonPressed.value = false;
        if (response.status == true) {
          showSuccessSnackbar(context, context.successful);
          AppConstants.typeReq == 'order';
          Get.toNamed(Routes.reviewPayMentScreen);
        } else {
          showErrorSnackbar(context, response.message ?? '');
        }
      },
      failure: (error) {
        isButtonPressed.value = false;
        showSnackbarErrorApi(Get.context!, [error], null);
      },
    );
  }
}
