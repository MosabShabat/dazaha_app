import 'package:geolocator/geolocator.dart';

import '../../../core/constant/exports_libraries.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/network/utils/api_error_handler.dart';
import '../../../core/network/utils/api_result.dart';
import '../../../core/network/utils/api_service.dart';
import '../../../core/network/utils/app_response.dart';
import '../../choose_the_service/controller/order_data_controller.dart';

class ItemAdDetailsRepo {
  final ApiService _apiService;
  OrderDataController _orderDataController = Get.find<OrderDataController>();

  ItemAdDetailsRepo(this._apiService);
  //getOrderDetails
  Future<ApiResult<AppResponse>> getOrderDetails() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      final response = await _apiService.getOrderDetails(
        AppConstants.orderUuid,
        '${position.latitude}', // استخدم اللاتيتود الحالي
        '${position.longitude}', // استخدم اللونغيتود الحالي
      );
      print('getOrdersAll response: $response');
      print('orderUuid response: ${AppConstants.orderUuid}');

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<AppResponse>> AddOffer(timeUuid) async {
    try {
      final response = await _apiService.AddOffer(
        AppConstants.orderUuid,
        timeUuid,
        _orderDataController.likedPrice.value,
      );
      print('Response from AddOffer: $response');
      print('orderUuid response: ${AppConstants.orderUuid}');

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  //AddOffer
}
