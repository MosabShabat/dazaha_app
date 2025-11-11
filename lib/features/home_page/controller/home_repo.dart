import '../../../../core/network/utils/api_error_handler.dart';
import '../../../../core/network/utils/api_result.dart';
import '../../../../core/network/utils/api_service.dart';
import '../../../../core/network/utils/app_response.dart';

class HomeRepo {
  final ApiService _apiService;

  HomeRepo(this._apiService);

  Future<ApiResult<AppResponse>> getHome({String? lat, String? lng}) async {
    try {
      final response = await _apiService.getHome(lat: lat, lng: lng);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<AppResponse>> online() async {
    try {
      final response = await _apiService.online();
      print('response is ================ $response');
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
