import '../../../core/constant/exports_libraries.dart';
import '../../../core/network/utils/api_error_handler.dart';
import '../../../core/network/utils/api_result.dart';
import '../../../core/network/utils/api_service.dart';
import '../../../core/network/utils/app_response.dart';
import 'order_data_controller.dart';

class ChooseTheServiceRepo {
  final ApiService _apiService;
  final OrderDataController orderDataController = Get.find();
  ChooseTheServiceRepo(this._apiService);

  Future<ApiResult<AppResponse>> getIntro({String? serviceUuid}) async {
    try {
      final response = await _apiService.getIntro(serviceUuid: serviceUuid);
      print('getIntro response: $response');

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
