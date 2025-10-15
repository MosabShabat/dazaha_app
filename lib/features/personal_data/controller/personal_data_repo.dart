import '../../../../core/network/utils/api_service.dart';
import 'package:dio/dio.dart' as dio;
import '../../../../../core/network/utils/api_error_handler.dart';
import '../../../../../core/network/utils/api_result.dart';
import '../../../../../core/network/utils/app_response.dart';

class PersonalDataRepo {
  final ApiService _apiService;
  PersonalDataRepo(this._apiService);

  Future<ApiResult<AppResponse>> joinAsDriverPost({
    required String firstName,
    required String lastName,
    required String plate,
    required dio.MultipartFile? image,
    required dio.MultipartFile? id_image,
    required dio.MultipartFile? vehicle_image,
  }) async {
    try {
      final formData = dio.FormData();
      formData.fields.add(MapEntry('first_name', firstName));
      formData.fields.add(MapEntry('last_name', lastName));
      formData.fields.add(MapEntry('plate', plate));
      formData.files.add(MapEntry('image', image!));
      formData.files.add(MapEntry('id_image', id_image!));
      formData.files.add(MapEntry('vehicle_image', vehicle_image!));

      final response = await _apiService.postJoinAsDriver(formData);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
