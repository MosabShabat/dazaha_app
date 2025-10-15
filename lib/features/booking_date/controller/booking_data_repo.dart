import '../../../core/network/utils/api_error_handler.dart';
import '../../../core/network/utils/api_result.dart';
import '../../../core/network/utils/api_service.dart';
import '../../../core/network/utils/app_response.dart';

class BookingDataRepo {
  final ApiService _apiService;

  BookingDataRepo(this._apiService);

  Future<ApiResult<AppResponse>> getTime(String date) async {
    try {
      final response = await _apiService.getTime(date);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
