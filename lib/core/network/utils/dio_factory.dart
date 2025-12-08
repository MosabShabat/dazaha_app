import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../helpers/app_shared_data.dart';
import '../../helpers/constants.dart';
import 'api_constants.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Future<Dio> getDio() async {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio(
        BaseOptions(
          baseUrl: ApiConstants.apiBaseUrl,
          connectTimeout: timeOut,
          receiveTimeout: timeOut,
        ),
      );
      await addDioHeaders();
      addDioInterceptor();
    }

    return dio!;
  }

  static Future<void> addDioHeaders() async {
    String? token =
        await AppSharedData.getSecuredString(AppSharedKeys.userToken);
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization': token.isNotEmpty ? 'Bearer $token' : null,
      'Accept-Language': Get.locale?.languageCode ?? 'ar',
    };
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers['Authorization'] = 'Bearer $token';
  }

  static void updateLanguageHeader(String languageCode) {
    dio?.options.headers['Accept-Language'] = languageCode;
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
      ),
    );
  }
}
