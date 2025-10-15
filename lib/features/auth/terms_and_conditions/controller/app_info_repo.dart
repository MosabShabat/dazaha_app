import '../../../../core/network/utils/api_service.dart';
import '../../../../../core/network/utils/api_error_handler.dart';
import '../../../../../core/network/utils/api_result.dart';
import '../../../../../core/network/utils/app_response.dart';

class AppInfoRepo {
  final ApiService _apiService;

  AppInfoRepo(this._apiService);

  Future<ApiResult<AppResponse>> aboutApp() async {
    try {
      final response = await _apiService.aboutApp();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<AppResponse>> privacyPolicy() async {
    try {
      final response = await _apiService.privacyPolicy();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<AppResponse>> termsConditions() async {
    try {
      final response = await _apiService.termsConditions();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
