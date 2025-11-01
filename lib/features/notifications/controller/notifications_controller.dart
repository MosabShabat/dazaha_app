import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../../../core/network/models/notifications/notification_item.dart';
import '../../../core/network/models/notifications/notifications.dart';
import '../../../core/network/utils/api_result.dart';
import '../../../core/network/utils/app_response.dart';
import 'notifications_repo.dart';

class NotificationsController extends GetxController {
  final NotificationsRepo _notificationsRepo = Get.find<NotificationsRepo>();

  RxBool isLoading = false.obs;
  RxBool isLoadingMore = false.obs;
  RxInt currentPage = 1.obs;
  RxBool hasMorePages = true.obs;

  Rx<Notifications>? notificationsModel;
  var notificationsList = <NotificationItem>[].obs;

  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    resetControllerState();
    getNotifications();

    // scrollController.addListener(() {
    //   if (scrollController.position.extentAfter < 200) {
    //     loadMoreNotificationsModel();
    //   }
    // });
  }

  Future<void> getNotifications() async {
    if (isLoading.value || !hasMorePages.value) return;

    _setLoading(true);
    final result = await _notificationsRepo.getNotifications(currentPage.value);

    _handleApiResult(result);
    _setLoading(false);
  }

  Future<void> loadMoreNotificationsModel() async {
    if (isLoadingMore.value || !hasMorePages.value) return;

    currentPage.value += 1; // ✅ نزيد رقم الصفحة قبل الطلب
    _setLoadingMore(true);

    final result = await _notificationsRepo.getNotifications(currentPage.value);

    _handleApiResult(result);
    _setLoadingMore(false);
  }

  void _handleApiResult(ApiResult<AppResponse> result) {
    if (result is Success<AppResponse>) {
      final response = result.data;
      if (response.data != null) {
        _processResponse(response);
      } else {
        showSnackbarErrorApi(Get.context!, response.errors ?? [], null);
      }
    } else if (result is Failure) {
      showSnackbarErrorApi(Get.context!, [], null);

      // ✅ في حال فشل API للصفحات القادمة نرجع الصفحة مثل قبل
      if (currentPage.value > 1) currentPage.value -= 1;
    }
  }

  void _processResponse(AppResponse response) {
    if (response.status == true) {
      final model = Notifications.fromJson(
        response.data as Map<String, dynamic>,
      );

      final newItems = model.notification ?? [];

      log("✅ Loaded page: ${currentPage.value}, items: ${newItems.length}");

      if (newItems.isNotEmpty) {
        notificationsList.addAll(newItems);
        if (newItems.length < 15) hasMorePages.value = false;
      } else {
        hasMorePages.value = false;
      }
    }
  }

  Future<void> refreshNotifications() async {
    resetControllerState();
    await getNotifications();
  }

  void resetControllerState() {
    currentPage.value = 1;
    hasMorePages.value = true;
    notificationsList.clear();
  }

  void _setLoading(bool value) {
    isLoading.value = value;
  }

  void _setLoadingMore(bool value) {
    isLoadingMore.value = value;
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
