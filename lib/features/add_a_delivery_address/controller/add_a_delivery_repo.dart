import '../../../core/network/utils/api_error_handler.dart';
import '../../../core/network/utils/api_result.dart';
import '../../../core/network/utils/api_service.dart';
import '../../../core/network/utils/app_response.dart';

class AddADeliveryRepo {
  final ApiService _apiService;
  AddADeliveryRepo(this._apiService);

  Future<ApiResult<AppResponse>> requirements({
    required List<String> requirements,
  }) async {
    try {
      final response = await _apiService.requirements(
        requirements: requirements,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<AppResponse>> addAddress(
    String name,
    String cityUuid,
    String areaUuid,
    String street,
    String mobile,
    String lat,
    String lng,
  ) async {
    try {
      final response = await _apiService.addAddress(
        name,
        cityUuid,
        areaUuid,
        street,
        mobile,
        lat,
        lng,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<AppResponse>> updateAddress(
    String uuid,
    String name,
    String cityUuid,
    String areaUuid,
    String street,
    String mobile,
    String lat,
    String lng,
  ) async {
    try {
      final response = await _apiService.updateAddress(
        uuid,
        name,
        cityUuid,
        areaUuid,
        street,
        mobile,
        lat,
        lng,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<AppResponse>> addressDetails(String addressUuid) async {
    try {
      final response = await _apiService.getAddressDetails(addressUuid);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
