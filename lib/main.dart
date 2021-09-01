import 'package:flutter_user_list/di/injection.dart';
import 'package:flutter_user_list/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async => {
      await configureDependencies(),
      runApp(MyApp()),
    };

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Get User Info',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: pages,
      initialRoute: ROUTE_USERS_SCREEN,
    );
  }
}
