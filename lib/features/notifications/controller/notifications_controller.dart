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
  RxList<NotificationItem> notificationsList = <NotificationItem>[].obs;

  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    resetControllerState();
    getNotifications();
  }

  Future<void> getNotifications() async {
    if (isLoading.value || !hasMorePages.value) return;
    _setLoading(true);

    final result = await _notificationsRepo.getNotifications(currentPage.value);

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

  Future<void> loadMoreNotificationsModel() async {
    if (isLoadingMore.value || !hasMorePages.value) return;
    _setLoadingMore(true);

    final result = await _notificationsRepo.getNotifications(currentPage.value);

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

  void _processResponse(AppResponse response) {
    log("response1");
    if (response.status == true) {
      notificationsModel = Notifications.fromJson(
        response.data as Map<String, dynamic>,
      ).obs;

      final List<NotificationItem> newItems =
          notificationsModel!.value.notification ?? [];

      if (newItems.isNotEmpty) {
        log("Loaded notifications: ${newItems.length}");
        notificationsList.addAll(newItems);
        currentPage.value += 1;

        if (newItems.length < 15) {
          hasMorePages.value = false;
        }
      } else {
        hasMorePages.value = false;
      }
    } else {
      isLoading.value = false;
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
  void dispose() {
    Get.delete<NotificationsController>();
    super.dispose();
    log('NotificationsController disposed: dispose');
  }

  @override
  void onClose() {
    super.onClose();
    log('NotificationsController disposed: onClose');
  }
}
