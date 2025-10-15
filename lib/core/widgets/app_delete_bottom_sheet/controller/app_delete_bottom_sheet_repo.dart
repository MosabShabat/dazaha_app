import '../../../network/utils/api_error_handler.dart';
import '../../../network/utils/api_result.dart';
import '../../../network/utils/api_service.dart';
import '../../../network/utils/app_response.dart';

class AppDeleteBottomSheetRepo {
  final ApiService _apiService;

  AppDeleteBottomSheetRepo(this._apiService);

  Future<ApiResult<AppResponse>> deleteAccount() async {
    try {
      final response = await _apiService.deleteAccountSend();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
