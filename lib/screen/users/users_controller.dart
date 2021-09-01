import 'package:flutter_user_list/repo/user_repo.dart';
import 'package:flutter_user_list/responses/users_response.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class UsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController(
          GetIt.instance.get<IUserRepo>(),
        ));
  }
}

class UserController extends GetxController {
  var isLoading = false.obs;
  var users = UsersResponse().obs;
  final IUserRepo _repo;

  UserController(this._repo);

  void getUsers() async {
    isLoading.value = true;
    var res = await _repo.getUsers();
    users.value = res;
    isLoading.value = false;
  }

  @override
  void onInit() {
    // called immediately after the widget is allocated memory
    super.onInit();
    getUsers();
  }

  @override
  void onReady() {
    // called after the widget is rendered on screen
    // show dialog
    super.onReady();
  }

  @override
  void onClose() {
    // called just before the Controller is deleted from memory
    // close stream
    super.onClose();
  }
}
