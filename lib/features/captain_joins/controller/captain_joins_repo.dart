import '../../../core/network/utils/api_error_handler.dart';
import '../../../core/network/utils/api_result.dart';
import '../../../core/network/utils/api_service.dart';
import '../../../core/network/utils/app_response.dart';

class CaptainJoinsRepo {
  final ApiService _apiService;

  CaptainJoinsRepo(this._apiService);

  Future<ApiResult<AppResponse>> joinAsDriver() async {
    try {
      final response = await _apiService.joinAsDriver();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
