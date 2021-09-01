import 'package:dio/dio.dart';

abstract class BaseApiClient {
  Dio getDio({
    required String endpoint,
    int? timeOut,
    String? contentType,
  }) {
    var dio = Dio();

    // API end point
    dio.options.baseUrl = endpoint;

    // Set time out
    dio.options.connectTimeout = timeOut ?? 20000;
    dio.options.receiveTimeout = timeOut ?? 20000;
    dio.options.contentType = contentType ?? 'application/json';

    dio.interceptors.addAll([
      // Log
      LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
      ),

      InterceptorsWrapper(onRequest: (
        RequestOptions options,
        RequestInterceptorHandler handler,
      ) {
        options.headers = getHeaders();
        return handler.next(options);
      }, onError: (DioError e, ErrorInterceptorHandler handler) {
        if (e.response?.statusCode == 401) {
          onTokenExpired();
          return;
        }
        return handler.next(e);
      }),
    ]);
    return dio;
  }

  Map<String, dynamic>? getHeaders();

  void onTokenExpired();
}
