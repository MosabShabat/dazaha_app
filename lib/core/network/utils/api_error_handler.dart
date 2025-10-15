import 'package:dio/dio.dart';

import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(messages: ["Connection Error"]);
        case DioExceptionType.cancel:
          return ApiErrorModel(messages: ["Request Cancelled"]);
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(messages: ["Receive Timeout"]);
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(messages: ["Send Timeout"]);
        case DioExceptionType.badResponse:
          if (error.response?.data != null) {
            return _handleError(error.response?.data);
          } else {
            return ApiErrorModel(messages: ["Bad Response"]);
          }
        case DioExceptionType.unknown:
          print('OOOOOOOO here OOOOOOOOOOOO');
          print('Error message: ${error.message}');
          print('Error error: ${error.error}');
          print('Error response: ${error.response}');
          return ApiErrorModel(messages: ["Unknown Error"]);
        case DioExceptionType.badCertificate:
          return ApiErrorModel(messages: ["Bad Certificate"]);
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(messages: ["Connection Timeout"]);
      }
    } else {
      return ApiErrorModel(messages: ["Something went wrong"]);
    }
  }

  static ApiErrorModel _handleError(dynamic data) {
    return ApiErrorModel(
      fieldName: data['field_name'],
      messages: List<String>.from(data['messages'] ?? ['Something went wrong']),
    );
  }
}
