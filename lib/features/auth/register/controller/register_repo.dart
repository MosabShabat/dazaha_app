import '../../../../../core/network/utils/api_error_handler.dart';
import '../../../../../core/network/utils/api_result.dart';
import '../../../../../core/network/utils/api_service.dart';
import '../../../../../core/network/utils/app_response.dart';

class RegisterRepo {
  final ApiService _apiService;

  RegisterRepo(this._apiService);

  Future<ApiResult<AppResponse>> register(
    String firstName,
    String lastName,
    String email,
    String phoneNumber,
    String code,
    String fcmToken,
    String device,
  ) async {
    try {
      final response = await _apiService.register(
        firstName,
        lastName,
        email,
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
