import 'package:dio/dio.dart';
import 'package:flutter_user_list/models/user.dart';
import 'package:flutter_user_list/responses/users_response.dart';
import 'package:retrofit/http.dart';

part 'user_service.g.dart';

@RestApi()
abstract class UserService {
  factory UserService(Dio dio, {String baseUrl}) = _UserService;

  @GET('/data/v1/user')
  Future<UsersResponse> getUsers(
      {@Query('page') int? page = 0, @Query('limit') int? limit = 50});

  @GET('/data/v1/user/{userId}')
  Future<User> getUserDetail(@Path('userId') String userId);
}
