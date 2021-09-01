import 'package:flutter_user_list/models/location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? id;
  String? title;
  String? firstName;
  String? lastName;
  String? gender;
  String? email;
  String? dateOfBirth;
  String? registerDate;
  String? phone;
  String? picture;
  Location? location;

  User(
      {this.id,
      this.title,
      this.firstName,
      this.lastName,
      this.gender,
      this.email,
      this.dateOfBirth,
      this.registerDate,
      this.phone,
      this.picture,
      this.location});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
