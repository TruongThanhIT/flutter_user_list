import 'package:flutter_user_list/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_detail_response.g.dart';

@JsonSerializable()
class UserDetailResponse {
  User? data;

  UserDetailResponse({this.data});

  factory UserDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$UserDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailResponseToJson(this);
}
