import '../../../../../core/network/utils/api_error_handler.dart';
import '../../../../../core/network/utils/api_result.dart';
import '../../../../../core/network/utils/api_service.dart';
import '../../../../../core/network/utils/app_response.dart';

class SavedDeliveryAddressesRepo {
  final ApiService _apiService;

  SavedDeliveryAddressesRepo(this._apiService);

  Future<ApiResult<AppResponse>> deliveryAddresses({
    isStore,
    String? search,
  }) async {
    try {
      final response = await _apiService.deliveryAddresses(
        isStore: isStore,
        search: search,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<AppResponse>> deleteAddress(String addressUuid) async {
    try {
      final response = await _apiService.deleteAddress(addressUuid);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
