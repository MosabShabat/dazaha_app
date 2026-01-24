import '../../../core/constant/exports_widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import 'package:path/path.dart';
import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
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
import '../../price_details/controller/price_details_controller.dart';

class AdDetailsController extends GetxController {
  final AddADeliveryRepo _addRepo = Get.find();
  final OrdersRepo _ordersRepo = Get.find();
  final OrderDataController _orderDataController = Get.find();
  final PriceDetailsController priceDetailsController = Get.find();
  RxBool isButtonPressed = false.obs;
  RxBool isDataLoading = true.obs;

  RxList<Sizes> sizeMod = <Sizes>[].obs;
  final KeyboardDoneController doneController = KeyboardDoneController();

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
      showErrorSnackbar(context, context.enterTitle, FirstColor: Colors.amber);
      return;
    }
    if (decController.text.trim().isEmpty) {
      showErrorSnackbar(
        context,
        context.enterDescription,
        FirstColor: Colors.amber,
      );
      return;
    }

    _orderDataController.setTitle(titleController.text);
    _orderDataController.setDescription(decController.text);

    submitOrderRequest(context, orderType, page);
  }

  Future<File> compressImage(File file) async {
    final bytes = await file.readAsBytes();
    final image = img.decodeImage(bytes);
    if (image == null) return file;

    // تصغير الأبعاد (حد أقصى للعرض)
    final resized = img.copyResize(image, width: 1080);

    // ضغط الجودة
    final compressedBytes = img.encodeJpg(resized, quality: 40);

    final tempDir = await getTemporaryDirectory();
    final path = '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';

    return File(path).writeAsBytes(compressedBytes);
  }

  Future<dio.MultipartFile> prepareOrderImage(String path) async {
    File file = File(path);

    // ضغط الصورة دائمًا
    file = await compressImage(file);

    return dio.MultipartFile.fromFile(file.path, filename: basename(file.path));
  }

  Future<void> submitOrderRequest(
    BuildContext context,
    String orderType,
    page,
  ) async {
    _setButtonPressed(true);
    try {
      // تجهيز الملفات والصور
      List<dio.MultipartFile>? imageFiles;
      if (orderType != "type2") {
        imageFiles = await Future.wait(
          _orderDataController.images.map(
            (xfile) => prepareOrderImage(xfile.path),
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
      print('Date items:');
      print('Date orderType:$orderType');
      print('Date serviceUuid:${_orderDataController.serviceUuid.value}');
      print('Date date:${_orderDataController.data.value}');
      print('Date timeUuids:${_orderDataController.timeUuids}');
      print('Date fromLat:${_orderDataController.fromLat.value}');
      print('Date fromLng:${_orderDataController.fromLng.value}');
      print('Date fromAddress:${_orderDataController.fromAddress.value}');
      print('Date toLat:${_orderDataController.toLat.value}');
      print('Date toLng:${_orderDataController.toLng.value}');
      print('Date toAddress:${_orderDataController.toAddress.value}');
      print('Date title:${titleController.text}');
      print('Date description:${decController.text}');
      print('Date sizeUuid:${_orderDataController.sizeUuid.value}');
      print(
        'Date fromDeliveryAddressUuid:${_orderDataController.fromDeliveryAddressUuid.value}',
      );
      print(
        'Date toDeliveryAddressUuid:${_orderDataController.toDeliveryAddressUuid.value}',
      );
      print(
        'Date receiptMethodUuid:${_orderDataController.receiptMethodUuid.value}',
      );
      print('Date canHelp:${_orderDataController.canHelp.value}');
      print('Date helpers:${_orderDataController}');
      print('Date images:$imageFiles');
      print('Date items:$itemsData');

      print('==========================');
      String convertArabicDateToEnglish(String date) {
        const arabicNumbers = [
          '٠',
          '١',
          '٢',
          '٣',
          '٤',
          '٥',
          '٦',
          '٧',
          '٨',
          '٩',
        ];
        for (int i = 0; i < 10; i++) {
          date = date.replaceAll(arabicNumbers[i], i.toString());
        }
        return date;
      }

      final String englishDate = convertArabicDateToEnglish(
        _orderDataController.data.value,
      );
      print('English date: $englishDate'); // يجب أن يطبع 2025-10-29

      print('formattedDate : ${englishDate}');

      final result = await _ordersRepo.createOrder(
        orderType: orderType,
        serviceUuid: _orderDataController.serviceUuid.value,
        date: englishDate,
        timeUuids: _orderDataController.timeUuids,
        fromLat: _orderDataController.fromLat.value,
        fromLng: _orderDataController.fromLng.value,
        fromAddress: _orderDataController.fromAddress.value,
        toLat: orderType == "type2"
            ? _orderDataController.toLat.value
            : _orderDataController.toLat.value,
        toLng: orderType == "type2"
            ? _orderDataController.toLng.value
            : _orderDataController.toLng.value,
        toAddress: orderType == "type2"
            ? _orderDataController.toAddress.value
            : _orderDataController.toAddress.value,
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

      _handleResponse(context, result, page);
    } catch (e) {
      _setButtonPressed(false);
      showErrorSnackbar(
        Get.context!,
        'حدث خطأ أثناء معالجة البيانات: $e',
        FirstColor: Colors.red,
      );
    }
  }

  void _handleResponse(
    BuildContext context,
    ApiResult<AppResponse> result,
    page,
  ) {
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
            if (_orderDataController.serviceUuid.value ==
                '153a7042-eb9e-42b8-9d5c-498623adb5da') {
              priceDetailsController.priceController.text = '0';
              priceDetailsController.submitPrice(context, page);
            } else {
              Get.toNamed(Routes.priceDetailsScreen, arguments: {'page': page});
            }
          }
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
          showErrorSnackbar(
            Get.context!,
            response.message ?? '',
            FirstColor: Colors.red,
          );
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
