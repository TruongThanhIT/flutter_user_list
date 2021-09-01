import 'package:dio/dio.dart';
import 'package:flutter_user_list/dio/base_api_client.dart';
import 'package:flutter_user_list/service/user_service.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiClient extends BaseApiClient {
  late Dio dio;
  late UserService userService;

  ApiClient() {
    dio = getDio(endpoint: ApiEndPoint.END_POINT, timeOut: 5 * 60 * 1000);
    userService = UserService(dio);
  }

  @override
  Map<String, dynamic>? getHeaders() {
    return {'app-id': '61208522b0d589881428957f'};
  }

  @override
  void onTokenExpired() {
    // not handle
  }
}

class ApiEndPoint {
  static const String END_POINT = 'https://dummyapi.io';
}
