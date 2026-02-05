// import 'package:get/get.dart';

import '../../../core/helpers/constants.dart';
import '../../../core/network/utils/api_error_handler.dart';
import '../../../core/network/utils/api_result.dart';
import '../../../core/network/utils/api_service.dart';
import '../../../core/network/utils/app_response.dart';
// import '../../choose_the_service/controller/order_data_controller.dart';

class MyAdPayMentRepo {
  final ApiService _apiService;
  MyAdPayMentRepo(this._apiService);
  // OrderDataController _orderDataController = Get.find<OrderDataController>();

  Future<ApiResult<AppResponse>> getPayMent(String? couponCode) async {
    try {
      final response = await _apiService.getPayMent(
        AppConstants.orderUuid,
        AppConstants.offerUuid,
        couponCode,
      );
      print('getOrdersAll response: $response');
      print('orderUuid orderUuid: ${AppConstants.orderUuid}');
      print('orderUuid offerUuid: ${AppConstants.offerUuid}');

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<AppResponse>> executeOrder({
    required String paymentWayUuid,
    String? couponCode,
  }) async {
    try {
      final response = await _apiService.pay(
        AppConstants.orderUuid,
        AppConstants.offerUuid,
        paymentWayUuid,
        couponCode,
      );
      print('getOrdersAll response: $response');
      print('orderUuid orderUuid: ${AppConstants.orderUuid}');
      print('orderUuid offerUuid: ${AppConstants.offerUuid}');
      print('orderUuid paymentWayUuid: ${paymentWayUuid}');
      print('orderUuid couponCode: ${couponCode}');

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
