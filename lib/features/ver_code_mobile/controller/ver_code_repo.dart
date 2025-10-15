import '../../../../../core/network/utils/api_error_handler.dart';
import '../../../../../core/network/utils/api_result.dart';
import '../../../../../core/network/utils/api_service.dart';
import '../../../../../core/network/utils/app_response.dart';

class VerCodeRepo {
  final ApiService _apiService;
  VerCodeRepo(this._apiService);

  Future<ApiResult<AppResponse>> verifyCode(
    String phoneNumber,
    String code,
  ) async {
    try {
      final response = await _apiService.verifyCodeUpdateMobile(
        phoneNumber,
        code,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
