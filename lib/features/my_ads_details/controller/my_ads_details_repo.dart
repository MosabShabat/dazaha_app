import '../../../core/helpers/constants.dart';
import '../../../core/network/utils/api_error_handler.dart';
import '../../../core/network/utils/api_result.dart';
import '../../../core/network/utils/api_service.dart';
import '../../../core/network/utils/app_response.dart';

class MyAdsDetailsRepo {
  final ApiService _apiService;

  MyAdsDetailsRepo(this._apiService);

  Future<ApiResult<AppResponse>> getMyOrders() async {
    try {
      final response = await _apiService.getMyOrderDetails(
        AppConstants.orderUuid,
      );
      print('getMyOrders response: $response');
      print('getMyOrders uuid: ${AppConstants.orderUuid}');

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<AppResponse>> deleteOrder() async {
    try {
      final response = await _apiService.deleteOrder(AppConstants.orderUuid);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<AppResponse>> getMyOrderOffers(String orderBy) async {
    try {
      final response = await _apiService.getMyOrderOffers(
        AppConstants.orderUuid,
        orderBy,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
//getMyOrderDetails