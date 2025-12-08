import '../../../core/helpers/constants.dart';
import '../../../core/network/utils/api_error_handler.dart';
import '../../../core/network/utils/api_result.dart';
import '../../../core/network/utils/api_service.dart';
import '../../../core/network/utils/app_response.dart';

class DirectSupportMapRepo {
  final ApiService _apiService;

  DirectSupportMapRepo(this._apiService);

  Future<ApiResult<AppResponse>> putState(String state) async {
    try {
      final response = await _apiService.putState(
        AppConstants.PutStatUuid,
        state,
      );
      print('getOrdersAll response: $response');
      print('PutStatUuid response: ${AppConstants.PutStatUuid}');

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}//putState