import 'package:flutter_user_list/models/user.dart';
import 'package:flutter_user_list/repo/user_repo.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class UserDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserDetailController>(() => UserDetailController(
          GetIt.instance.get<IUserRepo>(),
        ));
  }
}

class UserDetailController extends GetxController {
  var isLoading = true.obs;
  var data = User().obs;

  final IUserRepo _repo;

  UserDetailController(this._repo);

  @override
  void onInit() {
    super.onInit();
    String? userId = Get.arguments;
    getUserDetail(userId);
  }

  void getUserDetail(String? userId) async {
    isLoading.value = true;
    var res = await _repo.getUserDetail(userId ?? '');
    data.value = res;
    isLoading.value = false;
  }
}
