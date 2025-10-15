import '../../../core/constant/exports_libraries.dart';
import '../../../core/network/utils/api_error_handler.dart';
import '../../../core/network/utils/api_result.dart';
import '../../../core/network/utils/api_service.dart';
import '../../../core/network/utils/app_response.dart';
import '../../choose_the_service/controller/order_data_controller.dart';

class AllAdsRepo {
  final ApiService _apiService;
  final OrderDataController orderDataController = Get.find();

  AllAdsRepo(this._apiService);

  Future<ApiResult<AppResponse>> getOrdersAll({
    int page = 1,
    String? serviceUuid,
    String? status,
    String? search,
  }) async {
    try {
      final response = await _apiService.getOrdersAll(
        serviceUuid: serviceUuid,
        status: status,
        search: search,
        page: page,

        // orderDataController.offerStatus.value,
        // page,
      );
      print('getOrdersAll response: $response');
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
