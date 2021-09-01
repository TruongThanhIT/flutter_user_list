import 'package:json_annotation/json_annotation.dart';

part '${NAME}.g.dart';

@JsonSerializable()
class ${ObjectName}{

  factory ${ObjectName}.fromJson(Map<String, dynamic> json) => _${ObjectName}FromJson(json);

  Map<String, dynamic> toJson() => _${ObjectName}ToJson(this);
}

#flutter packages pub run build_runner build --delete-conflicting-outputs

