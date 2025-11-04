import '../../../../../core/network/utils/api_error_handler.dart';
import '../../../../../core/network/utils/api_result.dart';
import '../../../../../core/network/utils/api_service.dart';
import '../../../../../core/network/utils/app_response.dart';
import '../../../core/constant/exports_libraries.dart';
import '../../choose_the_service/controller/order_data_controller.dart';

class PriceDetailsRepo {
  final ApiService _apiService;
  OrderDataController _orderDataController = Get.find<OrderDataController>();
  PriceDetailsRepo(this._apiService);

  Future<ApiResult<AppResponse>> summaryPostOrders({price}) async {
    try {
      final response = await _apiService.summaryPostOrders(
        orderUuid: _orderDataController.OrderUuid.value,
        likedPrice: price,
      );
      print('Response from summaryPostOrders: $response');

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
