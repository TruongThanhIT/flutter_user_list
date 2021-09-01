import 'package:flutter_user_list/dio/api_client.dart';
import 'package:flutter_user_list/models/user.dart';
import 'package:flutter_user_list/responses/users_response.dart';
import 'package:injectable/injectable.dart';

abstract class IUserRepo {
  Future<UsersResponse> getUsers();

  Future<User> getUserDetail(String userId);
}

@Singleton(as: IUserRepo)
class UserRepo implements IUserRepo {
  final ApiClient _apiClient;

  UserRepo(this._apiClient);

  @override
  Future<UsersResponse> getUsers() => _apiClient.userService.getUsers();

  @override
  Future<User> getUserDetail(String userId) =>
      _apiClient.userService.getUserDetail(userId);
}
