import '../../../../../core/network/utils/api_error_handler.dart';
import '../../../../../core/network/utils/api_result.dart';
import '../../../../../core/network/utils/api_service.dart';
import '../../../../../core/network/utils/app_response.dart';

class ProfileRepo {
  final ApiService _apiService;
  ProfileRepo(this._apiService);

  Future<ApiResult<AppResponse>> logout(String fcmToken) async {
    try {
      final response = await _apiService.logout(fcmToken);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<AppResponse>> profile() async {
    try {
      final response = await _apiService.profile();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
