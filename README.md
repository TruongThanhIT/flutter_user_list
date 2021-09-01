# Getting Started

- Clone or download this repository
- Run ```flutter clean```
- Run ```flutter pub get```
- Run ```flutter packages pub run build_runner build --delete-conflicting-outputs```
- Build and feel free to use this app without any account

# Functionalities
- Show user list screen
- Navigate to user detail screen when user item clicked

# Libraries and Frameworks

- Network
   - Retrofit: https://pub.dev/packages/retrofit)
   - Dio: https://pub.dev/packages/dio
   - JSON Parser: https://pub.dev/packages/json_serializable
   - Script build json object:
```
import 'package:json_annotation/json_annotation.dart';

part '${NAME}.g.dart';

@JsonSerializable()
class ${ObjectName}{

  factory ${ObjectName}.fromJson(Map<String, dynamic> json) => _${ObjectName}FromJson(json);

  Map<String, dynamic> toJson() => _${ObjectName}ToJson(this);
}

```
    - Then run ```flutter packages pub run build_runner build --delete-conflicting-outputs``` to generate model
- Dependency
    - GetIt https://pub.dev/packages/get_it
    - Ref link: https://medium.com/flutter-community/the-flutter-getx-ecosystem-state-management-881c7235511d
    - Injectable: https://pub.dev/packages/injectable
- State management:
    - GetX: https://pub.dev/packages/get
- Controller:
    - https://medium.com/flutter-community/the-flutter-getx-ecosystem-state-management-881c7235511d
    - GetX Binding controller: https://medium.com/flutter-community/the-flutter-getx-ecosystem-dependency-injection-8e763d0ec6b9



