import '../../../../core/network/utils/api_error_handler.dart';
import '../../../../core/network/utils/api_result.dart';
import '../../../../core/network/utils/api_service.dart';
import '../../../../core/network/utils/app_response.dart';
import 'package:dio/dio.dart' as dio;

import '../../../core/helpers/constants.dart';

class ChatTechnicalSupportRepo {
  final ApiService _apiService;

  ChatTechnicalSupportRepo(this._apiService);

  Future<ApiResult<AppResponse>> getMessages(String receiverUuid) async {
    try {
      final response = await _apiService.getMessages(receiverUuid);
      ();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<AppResponse>> sendMessage({
    required String receiverUuid,
    required String contentType,
    String? contentText,
    dio.MultipartFile? contentImage,
  }) async {
    try {
      final formData = dio.FormData();

      formData.fields.add(MapEntry('content_type', contentType));

      if (contentType == MessageTypes.messageText) {
        formData.fields.add(MapEntry('content', contentText!));
      }

      if (contentType == MessageTypes.messageImage) {
        formData.files.add(MapEntry('content', contentImage!));
      }

      final response = await _apiService.sendMessage(receiverUuid, formData);

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
