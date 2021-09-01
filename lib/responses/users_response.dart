import 'package:flutter_user_list/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'users_response.g.dart';

@JsonSerializable()
class UsersResponse {
  List<User>? data;

  UsersResponse({this.data});

  factory UsersResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UsersResponseToJson(this);
}
