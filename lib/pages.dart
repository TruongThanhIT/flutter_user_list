import 'package:flutter_user_list/screen/user_detail/user_detail_controller.dart';
import 'package:flutter_user_list/screen/user_detail/user_detail_screen.dart';
import 'package:flutter_user_list/screen/users/users_controller.dart';
import 'package:flutter_user_list/screen/users/users_screen.dart';
import 'package:flutter_user_list/tab/bottom_navigation_screen.dart';
import 'package:get/get.dart';

const String ROUTE_USERS_SCREEN = '/ROUTE_USERS_SCREEN';
const String ROUTE_USER_DETAIL_SCREEN = '/ROUTE_USER_DETAIL_SCREEN';
const String ROUTE_HOME_SCREEN = '/ROUTE_HOME_SCREEN';

var pages = [
  GetPage(
    name: ROUTE_HOME_SCREEN,
    page: () => BottomNavigationScreen(),
    bindings: [],
  ),
  GetPage(
    name: ROUTE_USERS_SCREEN,
    page: () => UsersScreen(),
    bindings: [UsersBinding()],
  ),
  GetPage(
    name: ROUTE_USER_DETAIL_SCREEN,
    page: () => UserDetailScreen(),
    bindings: [UserDetailBinding()],
  ),
];
