import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  String? street;
  String? city;
  String? state;
  String? country;
  String? timeZone;

  Location({this.street, this.city, this.state, this.country, this.timeZone});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
