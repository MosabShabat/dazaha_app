import '../../../core/constant/exports_libraries.dart';
import '../../../core/network/utils/api_error_handler.dart';
import '../../../core/network/utils/api_result.dart';
import '../../../core/network/utils/api_service.dart';
import '../../../core/network/utils/app_response.dart';
import '../../choose_the_service/controller/order_data_controller.dart';

class AdvertisementSummaryRepo {
  final ApiService _apiService;
  final OrderDataController _orderDataController =
      Get.find<OrderDataController>();
  AdvertisementSummaryRepo(this._apiService);

  Future<ApiResult<AppResponse>> confirmOrders() async {
    try {
      final response = await _apiService.confirmOrders(
        _orderDataController.OrderUuid.value,
      );
      print('Response from summaryPostOrders: $response');
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
