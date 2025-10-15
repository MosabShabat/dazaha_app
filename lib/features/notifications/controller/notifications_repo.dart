import '../../../../core/network/utils/api_error_handler.dart';
import '../../../../core/network/utils/api_result.dart';
import '../../../../core/network/utils/api_service.dart';
import '../../../../core/network/utils/app_response.dart';

class NotificationsRepo {
  final ApiService _apiService;

  NotificationsRepo(this._apiService);

  Future<ApiResult<AppResponse>> getNotifications(int page) async {
    try {
      final response = await _apiService.getNotifications(page);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
