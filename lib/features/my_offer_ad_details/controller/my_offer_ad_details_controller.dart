import 'dart:developer';

import '../../../../core/constant/exports_widgets.dart';

import '../../../core/helpers/constants.dart';
import '../../../core/network/models/offers/offer_detail.dart';
import '../../../core/network/utils/api_error_model.dart';
import '../../../core/network/utils/api_result.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../../core/network/utils/app_response.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../../../core/widgets/app_snackbar_with_button.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../../document/controller/document_controller.dart';
import '../../item_ad_details/widgets/my_offer_to_customer_widget.dart';
import 'offer_details_repo.dart';

class MyOfferAdDetailsController extends GetxController {
  final OfferDetailsRepo _offerDetailsRepo = Get.find<OfferDetailsRepo>();
  final OrderDataController _orderDataController = Get.find();
  final TextEditingController priceController = TextEditingController();

  RxBool isLoading = true.obs;
  RxBool isButtonPressed = false.obs;
  var isLoadingDelete = false.obs;

  var selectedIndex = 0.obs;

  Rx<OfferDetail>? offerDetailsItem;

  @override
  void onInit() {
    super.onInit();
    AppConstants.orderUuid = _orderDataController.offerItemDetUuid.value;
    getOfferDetails();

    ever(_orderDataController.offerItemDetUuid, (_) {
      getOfferDetails();
    });
  }

  //delete_the_ad  do_you_want_to_delete_the_ad
  void getOfferDetails() async {
    isLoading.value = true;
    final result = await _offerDetailsRepo.getOfferDetails();
    result.when(
      success: (response) {
        isLoading.value = false;
        if (response.status == true) {
          if (response.data != null) {
            offerDetailsItem = OfferDetail.fromJson(response.data).obs;
          } else {
            showSnackbarErrorApi(Get.context!, response.errors ?? [], null);
          }
        } else {
          isLoading.value = false;
          log('Error: ${response.message}');

          if (response.message!.contains('No query results for model') ||
              response.message!.contains(
                'foreach() argument must be of type array|object, int given',
              )) {
            log('Error: ${response.message}');
          } else {
            showErrorSnackbar(
              Get.context!,
              response.message ?? '',
              FirstColor: Colors.red,
            );
          }
        }
      },
      failure: (error) {
        isLoading.value = false;
        log('Error fetching order details: $error');

        showSnackbarErrorApi(Get.context!, [error], null);
      },
    );
  }

  void validationInputData(BuildContext context) {
    if (priceController.text.isEmpty) {
      showErrorSnackbar(context, context.enterAmount, FirstColor: Colors.amber);
      return;
    }
    _orderDataController.setLikedPrice(priceController.text);
    _orderDataController.setTimeUuid(_orderDataController.timeUuid.value);

    updateOffer(context);
  }

  void changeSelect(int index) {
    selectedIndex.value = index;
  }

  void updateOffer(BuildContext context) async {
    _setButtonPressed(true);
    try {
      final result = await _offerDetailsRepo.updateOffer();
      _handleOfferResponse(result, context);
    } catch (e) {
      _setButtonPressed(false);
      showErrorSnackbar(context, context.error, FirstColor: Colors.red);
    }
  }

  void _handleOfferResponse(
    ApiResult<AppResponse> result,
    BuildContext context,
  ) {
    result.when(
      success: (response) async {
        _setButtonPressed(false);

        if (response.status == true) {
          // 1️⃣ جلب بيانات العرض الجديدة من السيرفر بعد التحديث
          final updatedResult = await _offerDetailsRepo.getOfferDetails();
          updatedResult.when(
            success: (updatedResponse) {
              if (updatedResponse.status == true &&
                  updatedResponse.data != null) {
                offerDetailsItem?.value = OfferDetail.fromJson(
                  updatedResponse.data,
                );
              }
            },
            failure: (_) {},
          );

          // 2️⃣ تحديث قائمة العروض في الشاشة الرئيسية
          final documentController = Get.find<DocumentController>();
          documentController.refreshOrders();

          // 3️⃣ إغلاق الـ BottomSheet والشاشة السابقة
          if (Navigator.of(context).canPop())
            Navigator.of(context).pop(); // إغلاق الـ BottomSheet
          if (Navigator.of(context).canPop())
            Navigator.of(context).pop(); // العودة للشاشة السابقة

          // 4️⃣ عرض رسالة نجاح
          MyOfferToCustomerWidget(
            context,
            IsShowRow: false,
            title: '${context.displaySuccessfullyUpdated}',
            onTap: () {},
          );
        } else {
          showErrorSnackbar(
            context,
            response.message ?? '',
            FirstColor: Colors.red,
          );
        }
      },
      failure: (error) {
        _setButtonPressed(false);
        _showApiErrors([error], context);
      },
    );
  }

  void _showApiErrors(List<ApiErrorModel> errors, BuildContext context) {
    showSnackbarErrorApi(context, errors, null);
  }

  // void updateOffer(BuildContext context) async {
  //   _setButtonPressed(true);
  //   try {
  //     final result = await _offerDetailsRepo.updateOffer();
  //     _handleOfferResponse(result);
  //   } catch (e) {
  //     _setButtonPressed(false);
  //     showErrorSnackbar(context, context.error, FirstColor: Colors.red);
  //   }
  // }

  // void _handleOfferResponse(ApiResult<AppResponse> result) {
  //   result.when(
  //     success: (response) async {
  //       _setButtonPressed(false);

  //       if (response.status == true) {
  //         // 1️⃣ جلب بيانات العرض الجديدة من السيرفر بعد التحديث
  //         final updatedResult = await _offerDetailsRepo.getOfferDetails();
  //         updatedResult.when(
  //           success: (updatedResponse) {
  //             if (updatedResponse.status == true &&
  //                 updatedResponse.data != null) {
  //               offerDetailsItem?.value = OfferDetail.fromJson(
  //                 updatedResponse.data,
  //               );
  //             }
  //           },
  //           failure: (_) {},
  //         );

  //         // 2️⃣ تحديث قائمة العروض في الشاشة الرئيسية
  //         final documentController = Get.find<DocumentController>();
  //         documentController.refreshOrders();

  //         // 3️⃣ إغلاق الـ BottomSheet والشاشة
  //         Get.back(); // إغلاق الـ BottomSheet
  //         Get.back(); // العودة إلى الشاشة السابقة
  //         print('MyOfferToCustomerWidget : ');
  //         MyOfferToCustomerWidget(
  //           Get.context!,
  //           IsShowRow: false,
  //           title: '${Get.context!.displaySuccessfullyUpdated}',
  //           onTap: () {},
  //         );
  //       } else {
  //         showErrorSnackbar(
  //           Get.context!,
  //           response.message ?? '',
  //           FirstColor: Colors.red,
  //         );
  //       }
  //     },
  //     failure: (error) {
  //       _setButtonPressed(false);
  //       _showApiErrors([error]);
  //     },
  //   );
  // }

  void deleteOffer() async {
    _setLoadingDelete(true);
    final result = await _offerDetailsRepo.deleteOffer();
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

  void _setLoading(bool value) {
    isLoading.value = value;
  }

  _setLoadingDelete(bool value) {
    isLoadingDelete.value = value;
  }

  void _setButtonPressed(bool value) => isButtonPressed.value = value;
}
