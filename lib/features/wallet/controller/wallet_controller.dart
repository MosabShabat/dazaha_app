import 'dart:developer';

import '../../../../../../core/constant/exports_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../../core/network/models/wallet/wallet_model.dart';
import '../../../../../../core/widgets/app_snackbar.dart';
import '../../../core/helpers/app_shared_methods.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/network/models/wallet/execute_order_model.dart';
import '../../../core/network/models/wallet/record_transactions_model.dart';
import '../../../core/network/utils/api_result.dart';
import '../../../core/network/utils/app_response.dart';
import '../../../core/widgets/app_snackbar_with_button.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../widgets/payment_web_view_screen.dart';
import 'wallet_repo.dart';

class WalletController extends GetxController {
  final WalletRepo _walletRepo = Get.find<WalletRepo>();
  RxInt selectedIndex = 0.obs; // بدل int

  RxBool isLoading = false.obs;
  var isLoadingMore = false.obs;
  var currentPage = 1.obs;
  var hasMorePages = true.obs;

  Rx<WalletModel>? walletModel;
  var recordTransactionsModel = <RecordTransactionsModel>[].obs;

  final RefreshController refreshController = RefreshController();

  final ScrollController scrollController = ScrollController();
  final OrderDataController orderDataController = Get.find();

  final amountController = TextEditingController();
  RxBool isButtonPressed = false.obs;

  void changeSelect(int index) {
    selectedIndex.value = index;
  }

  ExecuteOrderModel? executeOrderModel;

 

  void validateInput(String transactionType) {
    if (amountController.text.isEmpty) {
      showErrorSnackbar(
        Get.context!,
        Get.context!.enterAmount,
        FirstColor: Colors.amber,
      );
      return;
    }
    if (transactionType == AppConstants.deposit) {
      depositRequest(amountController.text);
    } else {
      withdrawRequest(amountController.text);
    }
  }

  void depositRequest(String amount) async {
    isButtonPressed.value = true;
    final result = await _walletRepo.depositPay(amount: amount);
    isButtonPressed.value = true;
    result.when(
      success: (response) {
        if (response.status == true) {
          isButtonPressed.value = false;
          if (response.data != null) {
            executeOrderModel = ExecuteOrderModel.fromJson(
              response.data as Map<String, dynamic>,
            );
            if (executeOrderModel!.status == "initiated") {
              Get.back();
              if (executeOrderModel!.paymentUrl != null) {
                Get.to(
                  () => PaymentWebViewScreen(
                    paymentUrl: executeOrderModel!.paymentUrl!,
                  ),
                );
              }
              amountController.clear();
              getWallet();
              resetControllerState();
              refreshController.refreshCompleted();

              // Get.toNamed(
              //   Routes.moyasarPaymentMethodScreen,
              //   arguments: {
              //     AppConstants.paymentUuid: executeOrderModel!.paymentUuid,
              //     AppConstants.publishableApiKey: executeOrderModel!.apiKey,
              //     AppConstants.amount: executeOrderModel!.amount,
              //     AppConstants.description: executeOrderModel!.description,
              //     AppConstants.merchantId: executeOrderModel!.merchantId,
              //     AppConstants.paymentType: AppConstants.deposit,
              //   },
              // );
            }
          }
        } else {
          isButtonPressed.value = false;
          showErrorSnackbar(
            Get.context!,
            response.message ?? '',
            FirstColor: Colors.red,
          );
        }
        isButtonPressed.value = false;
      },
      failure: (error) {
        isButtonPressed.value = false;
        showSnackbarErrorApi(Get.context!, [error], null);
      },
    );
  }

  Future<void> refreshWallet() async {
    recordTransactionsModel.clear();
    currentPage.value = 1;
    hasMorePages.value = true;
    await getWallet();
  }

  void withdrawRequest(String amount) async {
    isButtonPressed.value = true;
    final result = await _walletRepo.withdrawalPay(amount: amount);
    isButtonPressed.value = true;

    result.when(
      success: (response) {
        if (response.status == true) {
          isButtonPressed.value = false;
          Get.back();
          showSnackbarWithButton(
            Get.context!,
            Get.context!.withdrawalSuccessfully,
            AppConstants.success,
            showButton: false,
          );
          amountController.clear();
          getWallet();
          resetControllerState();
          refreshController.refreshCompleted();
          Get.toNamed(Routes.balanceWithdrawalRequestScreen);
        } else {
          isButtonPressed.value = false;
          showErrorSnackbar(
            Get.context!,
            response.message ?? '',
            FirstColor: Colors.red,
          );
        }
        isButtonPressed.value = false;
      },
      failure: (error) {
        isButtonPressed.value = false;
        showSnackbarErrorApi(Get.context!, [error], null);
      },
    );
  }

  Future<void> getWallet() async {
    if (isLoading.value || !hasMorePages.value) return;
    _setLoading(true);

    ApiResult<AppResponse> result;

    result = await _walletRepo.getWallet(
      page: currentPage.value,
      fromDate: orderDataController.fromDate.isNotEmpty
          ? AppSharedMethods().normalizeDate(
              '${orderDataController.fromDate.value}',
            )
          : '',
      toDate: orderDataController.toDate.isNotEmpty
          ? AppSharedMethods().normalizeDate(
              '${orderDataController.toDate.value}',
            )
          : '',
    );

    // معالجة النتائج كما هي
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

  Future<void> loadMoRerecordTransactionsModel() async {
    if (isLoadingMore.value || !hasMorePages.value) return;
    _setLoadingMore(true);

    ApiResult<AppResponse> result;

    result = await _walletRepo.getWallet(
      page: currentPage.value,
      fromDate: orderDataController.fromDate.isNotEmpty
          ? AppSharedMethods().normalizeDate(
              '${orderDataController.fromDate.value}',
            )
          : '',
      toDate: orderDataController.toDate.isNotEmpty
          ? AppSharedMethods().normalizeDate(
              '${orderDataController.toDate.value}',
            )
          : '',
    );

    // معالجة النتائج
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

  void _processResponse(response) {
    log("response1");
    if (response.status == true) {
      walletModel = WalletModel.fromJson(
        response.data as Map<String, dynamic>,
      ).obs;

      if (walletModel!.value.recordTransactionsModel!.isNotEmpty) {
        recordTransactionsModel.addAll(
          walletModel!.value.recordTransactionsModel!,
        );
        currentPage.value += 1;
        // log('${response.pages.total}');
        if (walletModel!.value.recordTransactionsModel!.length < 15) {
          hasMorePages.value = false;
        }
      } else {
        hasMorePages.value = false;
      }
    }
  }

  void _setLoading(bool value) {
    isLoading.value = value;
  }

  void _setLoadingMore(bool value) {
    isLoadingMore.value = value;
  }

  // void onRefresh() {
  //   currentPage.value = 1;
  //   getWallet().then((_) {
  //     refreshController.refreshCompleted();
  //   });
  // }

  void resetControllerState() {
    currentPage.value = 1;
    hasMorePages.value = true;
    recordTransactionsModel.clear();
    getWallet();
  }

  @override
  void onClose() {
    resetControllerState();
    super.onClose();
  }
}
