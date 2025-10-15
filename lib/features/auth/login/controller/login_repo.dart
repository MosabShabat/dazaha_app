import '../../../../../core/network/utils/api_service.dart';
import '../../../../../core/network/utils/api_error_handler.dart';
import '../../../../../core/network/utils/api_result.dart';
import '../../../../../core/network/utils/app_response.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<AppResponse>> senCode(String phoneNumber) async {
    try {
      final response = await _apiService.sendCode(phoneNumber);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
