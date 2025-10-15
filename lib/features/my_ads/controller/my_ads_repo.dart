import '../../../core/network/utils/api_service.dart';
import '../../../core/network/utils/api_result.dart';
import '../../../core/network/utils/app_response.dart';
import '../../../core/network/utils/api_error_handler.dart';

class MyAdsRepo {
  final ApiService _apiService;

  MyAdsRepo(this._apiService);

  Future<ApiResult<AppResponse>> getMyOrders({
    int page = 1,
    String? serviceUuid,
    String? status,
    String? search,
  }) async {
    try {
      final response = await _apiService.getMyOrders(
        serviceUuid: serviceUuid,
        status: status,
        search: search,
        page: page,
      );
      print('getMyOrders response: $response');
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
