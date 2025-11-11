import '../../../../../../core/network/utils/api_service.dart';
import '../../../../../../core/network/utils/api_error_handler.dart';
import '../../../../../../core/network/utils/api_result.dart';
import '../../../../../../core/network/utils/app_response.dart';

class WalletRepo {
  final ApiService _apiService;
  WalletRepo(this._apiService);

  Future<ApiResult<AppResponse>> getWallet({
    int page = 1,
    String? fromDate,
    String? toDate,
  }) async {
    try {
      final response = await _apiService.getWallet(
        page: page,
        fromDate: fromDate,
        toDate: toDate,
      );
      print('getOrdersAll response: $response');
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<AppResponse>> depositPay({required String amount}) async {
    try {
      final response = await _apiService.depositPay(amount: amount);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<AppResponse>> withdrawalPay({required String amount}) async {
    try {
      final response = await _apiService.withdrawalPay(amount: amount);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
