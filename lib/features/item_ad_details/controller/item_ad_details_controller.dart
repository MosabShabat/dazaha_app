import 'dart:developer';

import 'package:geolocator/geolocator.dart';

import '../../../core/constant/exports_widgets.dart';

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
  final FocusNode priceFocusNode = FocusNode();
  final KeyboardDoneController doneController = KeyboardDoneController();

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
    print("AppConstants.orderUuid : ${AppConstants.orderUuid}");

    if (orderDetailsItem == null) {
      getOrderDetails();
    }
  }

  void getOrderDetails() async {
    isLoading.value = true;

    String? lat;
    String? lng;

    try {
      // تحقق من الصلاحية
      LocationPermission permission = await Geolocator.checkPermission();

      // إذا كانت الصلاحية مرفوضة، حاول طلبها مرة ثانية
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      // إذا تمت الموافقة، احصل على الإحداثيات
      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        lat = '${position.latitude}';
        lng = '${position.longitude}';
      } else {
        // المستخدم رفض، أكمل بدون موقع
        log('⚠️ تم رفض صلاحية الموقع — سيتم متابعة الطلب بدون موقع');
      }
    } catch (e) {
      // في حال حدوث أي خطأ أثناء قراءة الموقع
      log('❌ خطأ في الحصول على الموقع: $e');
    }

    // الآن أرسل الطلب سواء وُجد موقع أم لا
    final result = await _itemAdDetailsRepo.getOrderDetails(lat: lat, lng: lng);

    result.when(
      success: (response) {
        isLoading.value = false;
        if (response.status == true) {
          if (response.data != null && response.data is Map<String, dynamic>) {
            orderDetailsItem = OrdersDetailsItem.fromJson(response.data).obs;
          } else {
            showSnackbarErrorApi(Get.context!, response.errors ?? [], null);
          }
        } else {
          log('Error: ${response.message}');
          print('GGGGGGGGGGGGGGGG');
          print('Error: ${response.message}');
          if (response.message!.contains('No query results for model')) {
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

  final PageController pageController = PageController();

  void changeSelect(int index) {
    selectedIndex.value = index;
  }

  void validationInputData(BuildContext context) {
    if (priceController.text.isEmpty) {
      showErrorSnackbar(context, context.enterAmount, FirstColor: Colors.amber);
      return;
    }
    log(
      ' _orderDataController.timeUuid.value :${_orderDataController.timeUuid.value}',
    );
    _orderDataController.setLikedPrice(priceController.text);

    AddOffer(context, '${_orderDataController.timeUuid.value}');
  }

  void AddOffer(BuildContext context, timeUuid) async {
    _setButtonPressed(true);
    try {
      final result = await _itemAdDetailsRepo.AddOffer(timeUuid);
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
          // 1️⃣ الحصول على offer_uuid من البيانات المرتجعة
          String? offerUuid;
          if (response.data != null && response.data is Map<String, dynamic>) {
            final dataMap = response.data as Map<String, dynamic>;
            offerUuid = dataMap['offer_uuid']?.toString();
          }

          // 2️⃣ تحديث الـ controller بالـ offer_uuid الجديد
          if (offerUuid != null) {
            _orderDataController.setOfferItemDetUuid(offerUuid);
          }

          // تحديث تفاصيل الطلب
          getOrderDetails();
          if (Get.isBottomSheetOpen ?? false) {
            Get.back(); // إغلاق BottomSheet فقط
          }
          // عرض الـ widget الخاص بالعرض
          MyOfferToCustomerWidget(
            Get.context!,
            IsShowRow: false,
            title: '1',
            onTap: () {},
          );
          AppConstants.screenName = 'allAds';

          // التنقل إلى شاشة تفاصيل العرض
          Get.offAllNamed(Routes.myOfferAdDetailsScreen);
        } else {
          print('Error: ${response.message}');
          if (response.message!.contains('No query results for model')) {
            log('Error: ${response.message}');
          } else {
            showErrorSnackbar(
              Get.context!,
              response.message ?? '',
              FirstColor: Colors.red,
            );
          }
          // showErrorSnackbar(
          //   Get.context!,
          //   response.message ?? '',
          //   FirstColor: Colors.red,
          // );
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
