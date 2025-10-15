import '../../../../../core/network/utils/api_error_handler.dart';
import '../../../../../core/network/utils/api_result.dart';
import '../../../../../core/network/utils/api_service.dart';
import '../../../../../core/network/utils/app_response.dart';

class VerificationCodeRepo {
  final ApiService _apiService;
  VerificationCodeRepo(this._apiService);

  Future<ApiResult<AppResponse>> verifyCode(
    String phoneNumber,
    String code,
    String fcmToken,
    String device,
  ) async {
    try {
      final response = await _apiService.verifyCode(
        phoneNumber,
        code,
        fcmToken,
        device,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
