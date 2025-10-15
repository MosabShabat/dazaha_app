import '../../../../../core/network/utils/api_service.dart';

import '../../../../../core/network/utils/api_error_handler.dart';
import '../../../../../core/network/utils/api_result.dart';
import '../../../../../core/network/utils/app_response.dart';

class FaqRepo {
  final ApiService _apiService;

  FaqRepo(this._apiService);

  Future<ApiResult<AppResponse>> getFAQ() async {
    try {
      final response = await _apiService.getFAQ();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
