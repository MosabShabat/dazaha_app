import '../../../../../core/network/utils/api_service.dart';

import '../../../../../core/network/utils/api_error_handler.dart';
import '../../../../../core/network/utils/api_result.dart';
import '../../../../../core/network/utils/app_response.dart';

import 'package:dio/dio.dart' as dio;

class UserInfoRepo {
  final ApiService _apiService;

  UserInfoRepo(this._apiService);

  Future<ApiResult<AppResponse>> updateProfile({
    dio.MultipartFile? userImage,
    required String firstName,
    required String lastName,
    // String? email,
  }) async {
    try {
      final formData = dio.FormData();
      if (userImage != null) {
        formData.files.add(MapEntry('image', userImage));
      }
      formData.fields.add(MapEntry('first_name', firstName));
      formData.fields.add(MapEntry('last_name', lastName));

      // if (email != null) {
      //   formData.fields.add(MapEntry('email', email));
      // }

      final response = await _apiService.updateProfile(formData);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
