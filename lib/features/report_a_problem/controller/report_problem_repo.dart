import '../../../../core/network/utils/api_error_handler.dart';
import '../../../../core/network/utils/api_result.dart';
import '../../../../core/network/utils/api_service.dart';
import '../../../../core/network/utils/app_response.dart';
import 'package:dio/dio.dart' as dio;

class ReportProblemRepo {
  final ApiService _apiService;

  ReportProblemRepo(this._apiService);


    Future<ApiResult<AppResponse>> reportProblem({
    required String title,
    required String description,
    required String referenceType,
    required String referenceUuid,
    required List<dio.MultipartFile> images,
  }) async {
    try {
      final formData = dio.FormData();
      formData.fields.add(MapEntry('title', title));
      formData.fields.add(MapEntry('description', description));
      formData.fields.add(MapEntry('reference_type', referenceType));
      formData.fields.add(MapEntry('reference_uuid', referenceUuid));
      for (var image in images) {
        formData.files.add(MapEntry('images[]', image));
      }

      final response = await _apiService.reportProblem(formData);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

}
