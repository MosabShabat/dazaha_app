import '../../../core/constant/exports_widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import 'package:path/path.dart';
// import '../../../../core/helpers/constants.dart';
import '../../../../core/network/models/orders/order_uuid.dart';
import '../../../../core/network/models/sizes.dart';
import '../../../../core/network/utils/api_result.dart';
import '../../../../core/network/utils/app_response.dart';
import '../../../../core/widgets/app_snackbar.dart';
// import '../../../../core/widgets/app_snackbar_with_button.dart';
import '../../add_a_delivery_address/controller/add_a_delivery_repo.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import '../../../../features/ad_details/controller/ad_details_repo.dart';

class AdDetailsController extends GetxController {
  final AddADeliveryRepo _addRepo = Get.find();
  final OrdersRepo _ordersRepo = Get.find();
  final OrderDataController _orderDataController = Get.find();

  RxBool isButtonPressed = false.obs;
  RxBool isDataLoading = true.obs;

  RxList<Sizes> sizeMod = <Sizes>[].obs;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController decController = TextEditingController();

  RxInt selectedIndex = 0.obs;
  RxInt selectedIndex2 = 0.obs;
  RxBool switchValue = false.obs;

  void changeSelect(int index) => selectedIndex.value = index;
  void changeSelect2(int index) => selectedIndex2.value = index;
  void setSwitch(bool value) => switchValue.value = value;
  void toggleSwitch() => switchValue.value = !switchValue.value;

  @override
  void onInit() {
    super.onInit();
    getSizes();
  }

  void validateInput(BuildContext context, String orderType, page) {
    if (titleController.text.trim().isEmpty) {
      showErrorSnackbar(context, 'Enter Title');
      return;
    }
    if (decController.text.trim().isEmpty) {
      showErrorSnackbar(context, 'Enter Description');
      return;
    }

    _orderDataController.setTitle(titleController.text);
    _orderDataController.setDescription(decController.text);

    submitOrderRequest(orderType, page);
  }

  Future<void> submitOrderRequest(String orderType, page) async {
    _setButtonPressed(true);
    try {
      // تجهيز الملفات والصور
      List<dio.MultipartFile>? imageFiles;
      if (orderType != "type2") {
        imageFiles = await Future.wait(
          _orderDataController.images.map(
            (xfile) => dio.MultipartFile.fromFile(
              xfile.path,
              filename: basename(xfile.path),
            ),
          ),
        );
      }

      // تجهيز بيانات العناصر للنوع 2
      final itemsData = List.generate(_orderDataController.itemNames.length, (
        i,
      ) {
        return {
          'name': _orderDataController.itemNames[i],
          'quantity': _orderDataController.itemQuantities[i].toString(),
          'type': _orderDataController.itemTypes[i],
        };
      });

      final result = await _ordersRepo.createOrder(
        orderType: orderType,
        serviceUuid: _orderDataController.serviceUuid.value,
        date: _orderDataController.data.value,
        timeUuids: _orderDataController.timeUuids,
        fromLat: _orderDataController.fromLat.value,
        fromLng: _orderDataController.fromLng.value,
        fromAddress: _orderDataController.fromAddress.value,
        toLat: _orderDataController.toLat.value,
        toLng: _orderDataController.toLng.value,
        toAddress: _orderDataController.toAddress.value,
        title: titleController.text,
        description: decController.text,
        sizeUuid: _orderDataController.sizeUuid.value,
        fromDeliveryAddressUuid:
            _orderDataController.fromDeliveryAddressUuid.value,
        toDeliveryAddressUuid: _orderDataController.toDeliveryAddressUuid.value,
        receiptMethodUuid: _orderDataController.receiptMethodUuid.value,
        canHelp: _orderDataController.canHelp.value,
        helpers: '${_orderDataController.helpers.value}',
        images: imageFiles,
        items: orderType == "type2" ? itemsData : null,
      );

      _handleResponse(result, page);
    } catch (e) {
      _setButtonPressed(false);
      showErrorSnackbar(Get.context!, 'حدث خطأ أثناء معالجة البيانات: $e');
    }
  }

  void _handleResponse(ApiResult<AppResponse> result, page) {
    result.when(
      success: (response) {
        _setButtonPressed(false);
        if (response.status == true) {
          final orderUuidModel = OrderUuid.fromJson(
            response.data as Map<String, dynamic>,
          );
          if (orderUuidModel.uuid != null) {
            _orderDataController
              ..setOrderUuid(orderUuidModel.uuid!)
              ..setCurrencyVar(orderUuidModel.currency!)
              ..setExceptPrice(orderUuidModel.exceptPrice!)
              ..setOrderIdVar(orderUuidModel.orderId!);

            // showSnackbarWithButton(
            //   Get.context!,
            //   Get.context!.successOrder,
            //   AppConstants.success,
            //   showButton: false,
            // );
            Get.toNamed(Routes.priceDetailsScreen, arguments: {'page': page});
          }
        } else {
          showErrorSnackbar(Get.context!, response.message ?? '');
        }
      },
      failure: (error) {
        _setButtonPressed(false);
        showSnackbarErrorApi(Get.context!, [error], null);
      },
    );
  }

  void _setButtonPressed(bool value) => isButtonPressed.value = value;

  Future<void> getSizes() async {
    isDataLoading.value = true;
    final result = await _addRepo.requirements(requirements: ['sizes']);
    result.when(
      success: (response) {
        if (response.status == true && response.data != null) {
          final sizesRow =
              (response.data as Map<String, dynamic>)['sizes'] as List<dynamic>;
          sizeMod.assignAll(sizesRow.map((e) => Sizes.fromJson(e)).toList());
        } else {
          showErrorSnackbar(Get.context!, response.message ?? '');
        }
        isDataLoading.value = false;
      },
      failure: (error) {
        isDataLoading.value = false;
        showSnackbarErrorApi(Get.context!, [error], null);
      },
    );
  }
}
