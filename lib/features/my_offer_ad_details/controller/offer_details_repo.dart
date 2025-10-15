import '../../../core/constant/exports_libraries.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/network/utils/api_error_handler.dart';
import '../../../core/network/utils/api_result.dart';
import '../../../core/network/utils/api_service.dart';
import '../../../core/network/utils/app_response.dart';
import '../../choose_the_service/controller/order_data_controller.dart';

class OfferDetailsRepo {
  final ApiService _apiService;
  OrderDataController _orderDataController = Get.find<OrderDataController>();

  OfferDetailsRepo(this._apiService);

  Future<ApiResult<AppResponse>> getOfferDetails() async {
    try {
      final response = await _apiService.getOfferDetails(
        AppConstants.orderUuid,
      );
      print('getOrdersAll response: $response');
      print('orderUuid response: ${AppConstants.orderUuid}');

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
  //updateOffer

  Future<ApiResult<AppResponse>> updateOffer() async {
    try {
      final response = await _apiService.updateOffer(
        AppConstants.orderUuid,
        _orderDataController.timeUuid.value,
        _orderDataController.likedPrice.value,
      );
      print('Response from AddOffer: $response');
      print('orderUuid response: ${AppConstants.orderUuid}');

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<AppResponse>> deleteOffer() async {
    try {
      final response = await _apiService.deleteOffer(AppConstants.orderUuid);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
