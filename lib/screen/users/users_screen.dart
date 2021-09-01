import 'package:flutter_user_list/models/user.dart';
import 'package:flutter_user_list/screen/users/users_controller.dart';
import 'package:flutter_user_list/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../pages.dart';
import 'item_user_widget.dart';

class UsersScreen extends StatelessWidget {
  UsersScreen({Key? key}) : super(key: key);

  final UserController _userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Users'),
        ),
        body: Obx(
          () => _userController.isLoading.value
              ? LoadingWidget()
              : _buildSuccessWidget(),
        ));
  }

  Widget _buildSuccessWidget() {
    return ListView.builder(
      itemBuilder: (_, index) {
        return ItemUserWidget(
          user: _userController.users.value.data?[index],
          onItemClick: (user) => {
            _navigateToUserDetailScreen(user),
          },
        );
      },
      itemCount: _userController.users.value.data?.length ?? 0,
    );
  }

  void _navigateToUserDetailScreen(User? user) {
    Get.toNamed(ROUTE_USER_DETAIL_SCREEN, arguments: user?.id);
  }
}
