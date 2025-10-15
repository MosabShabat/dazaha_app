import '../../../core/network/utils/api_error_handler.dart';
import '../../../core/network/utils/api_result.dart';
import '../../../core/network/utils/api_service.dart';
import '../../../core/network/utils/app_response.dart';
import 'package:dio/dio.dart' as dio;

class OrdersRepo {
  final ApiService _apiService;
  OrdersRepo(this._apiService);

  Future<ApiResult<AppResponse>> createOrder({
    required String orderType, // type1 / type2 / type3
    required String serviceUuid,
    required String date,
    required List<String> timeUuids,
    String? fromDeliveryAddressUuid,
    required String fromLat,
    required String fromLng,
    required String fromAddress,
    String? toDeliveryAddressUuid,
    required String toLat,
    required String toLng,
    required String toAddress,
    String? receiptMethodUuid,
    String? canHelp,
    required String title,
    required String description,
    required String sizeUuid,
    String? helpers,
    List<Map<String, String>>? items,
    List<dio.MultipartFile>? images,
  }) async {
    try {
      final formData = dio.FormData();

      // الحقول المشتركة
      _addField(formData, 'service_uuid', serviceUuid);
      _addField(formData, 'date', date);
      for (var uuid in timeUuids) _addField(formData, 'time_uuids[]', uuid);
      _addField(formData, 'from_lat', fromLat);
      _addField(formData, 'from_lng', fromLng);
      _addField(formData, 'from_address', fromAddress);
      _addField(formData, 'to_lat', toLat);
      _addField(formData, 'to_lng', toLng);
      _addField(formData, 'to_address', toAddress);
      _addField(formData, 'title', title);
      _addField(formData, 'description', description);
      _addField(formData, 'size_uuid', sizeUuid);

      // التعامل حسب نوع الطلب
      switch (orderType) {
        case "type1":
          _addField(
            formData,
            'from_delivery_address_uuid',
            fromDeliveryAddressUuid ?? "",
          );
          _addField(
            formData,
            'to_delivery_address_uuid',
            toDeliveryAddressUuid ?? "",
          );
          _addField(formData, 'receipt_method_uuid', receiptMethodUuid ?? "");
          _addField(formData, 'can_help', canHelp ?? "");
          _addField(formData, 'helpers', helpers ?? "");
          _addFiles(formData, images);
          break;
        case "type2":
          if (items != null) {
            for (var i = 0; i < items.length; i++) {
              _addField(formData, 'items[$i][name]', items[i]['name']!);
              _addField(formData, 'items[$i][quantity]', items[i]['quantity']!);
              _addField(formData, 'items[$i][type]', items[i]['type']!);
            }
          }
          _addField(
            formData,
            'to_delivery_address_uuid',
            toDeliveryAddressUuid ?? "",
          );
          break;
        case "type3":
          _addField(
            formData,
            'from_delivery_address_uuid',
            fromDeliveryAddressUuid ?? "",
          );
          _addField(formData, 'helpers', helpers ?? "");
          _addFiles(formData, images);
          break;
      }

      final response = await _apiService.createOrder(formData);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  void _addField(dio.FormData formData, String key, String value) {
    formData.fields.add(MapEntry(key, value));
  }

  void _addFiles(dio.FormData formData, List<dio.MultipartFile>? files) {
    if (files != null) {
      for (var file in files) {
        formData.files.add(MapEntry('images[]', file));
      }
    }
  }
}
