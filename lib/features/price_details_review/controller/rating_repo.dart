import '../../../core/helpers/constants.dart';
import '../../../core/network/utils/api_constants.dart';
import '../../../core/network/utils/api_error_handler.dart';
import '../../../core/network/utils/api_result.dart';
import '../../../core/network/utils/api_service.dart';
import '../../../core/network/utils/app_response.dart';

class RatingRepo {
  final ApiService _apiService;

  RatingRepo(this._apiService);

  Future<ApiResult<AppResponse>> postRating(String rating) async {
    try {
      final response = await _apiService.postRating(
        AppConstants.typeReq == 'offer'
            ? ApiConstants.offers
            : ApiConstants.myOrder,
        AppConstants.orderUuid,
        rating,
      );
      print('getOrdersAll response: $response');
      print('orderUuid response: ${AppConstants.orderUuid}');

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
