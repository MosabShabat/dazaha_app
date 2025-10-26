import 'package:dazaha_app/core/constant/exports_libraries.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

import '../../../core/network/utils/api_result.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/widgets/app_snackbar.dart';
import '../../choose_the_service/controller/order_data_controller.dart';
import 'direct_support_map_repo.dart';

class DirectSupportMapController extends GetxController {
  final DirectSupportMapRepo _directSupportMapRepo =
      Get.find<DirectSupportMapRepo>();
  final OrderDataController _orderDataController = Get.find();

  final selectedCase = 0.obs; // 0: started, 1: delivered, 2: completed
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    AppConstants.orderUuid = _orderDataController.itemUuid.value;
    putState('started'); // البداية: الرحلة بدأت
  }

  Future<void> putState(String state) async {
    isLoading.value = true;
    final result = await _directSupportMapRepo.putState(state);

    result.when(
      success: (response) {
        isLoading.value = false;

        if (response.status == true) {
          if (response.data != null) {
            if (state == 'started')
              selectedCase.value = 0;
            else if (state == 'delivered')
              selectedCase.value = 1;
            else if (state == 'completed')
              selectedCase.value = 2;
          } else {
            print('response.errors : ${response.errors}');

            showSnackbarErrorApi(Get.context!, response.errors ?? [], null);
          }
        } else {
          print('response.message : ${response.message}');
          response.message == 'Offer in progress not found!'
              ? SizedBox.shrink()
              : showErrorSnackbar(
                  Get.context!,
                  response.message ?? '',
                  FirstColor: Colors.red,
                );
        }
      },
      failure: (error) {
        isLoading.value = false;
        showSnackbarErrorApi(Get.context!, [error], null);
      },
    );
  }

  /// فتح Google Maps مع نقاط متعددة
  /// [nextPoint] عدد النقاط القادمة (سيأخذ أول n نقطة من extraPoints)
  Future<void> openGoogleMaps() async {
    try {
      // الموقع الحالي
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      double currentLat = position.latitude;
      double currentLng = position.longitude;

      // جمع النقاط القادمة من الكنترولر
      List<LatLng> points = [];

      // إذا كانت هناك نقطة بداية (from)
      if (_orderDataController.fromLat.value.isNotEmpty &&
          _orderDataController.fromLng.value.isNotEmpty) {
        points.add(
          LatLng(
            double.tryParse(_orderDataController.fromLat.value) ?? 0.0,
            double.tryParse(_orderDataController.fromLng.value) ?? 0.0,
          ),
        );
      }

      // إذا كانت هناك نقطة نهاية (to)
      if (_orderDataController.toLat.value.isNotEmpty &&
          _orderDataController.toLng.value.isNotEmpty) {
        points.add(
          LatLng(
            double.tryParse(_orderDataController.toLat.value) ?? 0.0,
            double.tryParse(_orderDataController.toLng.value) ?? 0.0,
          ),
        );
      }

      if (points.isEmpty) {
        Get.snackbar('خطأ', 'لا توجد نقاط للانتقال إليها');
        return;
      }

      // الوجهة النهائية هي آخر نقطة
      final LatLng destination = points.last;

      // waypoints (كل النقاط ما عدا الأخيرة)
      final String waypoints = points.length > 1
          ? points
                .take(points.length - 1)
                .map((p) => '${p.latitude},${p.longitude}')
                .join('%7C') // ترميز صحيح للـ URL
          : '';

      // رابط Google Maps
      final Uri googleMapsUri = Uri.parse(
        'https://www.google.com/maps/dir/?api=1'
        '&origin=$currentLat,$currentLng'
        '&destination=${destination.latitude},${destination.longitude}'
        '${waypoints.isNotEmpty ? '&waypoints=$waypoints' : ''}'
        '&travelmode=driving',
      );

      // فتح Google Maps
      if (await canLaunchUrl(googleMapsUri)) {
        await launchUrl(googleMapsUri, mode: LaunchMode.externalApplication);
        putState('delivered');
      } else {
        Get.snackbar('خطأ', 'تعذّر فتح Google Maps');
      }
    } catch (e) {
      Get.snackbar('خطأ', 'تعذّر الحصول على الموقع الحالي');
    }
  }
}
