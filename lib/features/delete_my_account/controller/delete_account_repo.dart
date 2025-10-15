
import '../../../../../core/network/utils/api_error_handler.dart';
import '../../../../../core/network/utils/api_result.dart';
import '../../../../../core/network/utils/app_response.dart';
import '../../../core/network/utils/api_service.dart';

class DeleteAccountRepo {
  final ApiService _apiService;

  DeleteAccountRepo(this._apiService);

  Future<ApiResult<AppResponse>> deleteAccountInfo() async {
    try {
      final response = await _apiService.deleteAccountInfo();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
