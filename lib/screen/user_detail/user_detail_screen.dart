import 'package:flutter_user_list/screen/user_detail/user_detail_controller.dart';
import 'package:flutter_user_list/ext/string_extension.dart';
import 'package:flutter_user_list/util/date_util.dart';
import 'package:flutter_user_list/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetailScreen extends StatelessWidget {
  UserDetailScreen({Key? key}) : super(key: key);

  final UserDetailController _userDetailController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Obx(
              () => _userDetailController.isLoading.value
              ? LoadingWidget()
              : _buildSuccessWidget(),
        ));
  }

  Widget _buildSuccessWidget() {
    var user = _userDetailController.data.value;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color: Colors.lightBlue.shade50,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                    child: Image(
                      image: NetworkImage(user.picture ?? ''),
                      width: 100,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${user.title.capitalize()} ${user.firstName} ${user.lastName}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            overflow: TextOverflow.visible,
                          ),
                          ShortInfoWidget(
                            title: user.gender.capitalize(),
                            icon: user.gender == 'male'
                                ? Icons.male
                                : Icons.female,
                            color: user.gender == 'male'
                                ? Colors.blueAccent
                                : Colors.redAccent,
                          ),
                          ShortInfoWidget(
                            title: DateUtil()
                                .formatDateTime(user.dateOfBirth ?? ''),
                            icon: Icons.cake_outlined,
                            color: Colors.blueAccent,
                          ),
                          ShortInfoWidget(
                            title: user.phone,
                            icon: Icons.phone,
                            color: Colors.blueAccent,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          HeadLineWidget(
            title: 'Location',
          ),
          InfoLineWidget(
            title:
            '${user.location?.street}, ${user.location?.state}\n${user.location?.city}, ${user.location?.country}',
            icon: Icons.location_on_outlined,
          ),
          HeadLineWidget(
            title: 'Email',
          ),
          InfoLineWidget(
            title: user.email,
            icon: Icons.email_outlined,
          ),
          HeadLineWidget(
            title: 'Register Date',
          ),
          InfoLineWidget(
            title: DateUtil().formatDateTime(user.registerDate ?? ''),
            icon: Icons.date_range_outlined,
          )
        ],
      ),
    );
  }
}

class InfoLineWidget extends StatelessWidget {
  final String? title;
  final IconData? icon;

  const InfoLineWidget({Key? key, this.title, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.blueAccent,
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 8),
            child: Text(
              title ?? '',
              overflow: TextOverflow.visible,
            ),
          ),
        ),
      ],
    );
  }
}

class ShortInfoWidget extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final Color? color;

  const ShortInfoWidget({Key? key, this.title, this.icon, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: this.color,
        ),
        Container(
          margin: const EdgeInsets.only(left: 8),
          child: Text(
            title ?? '',
            overflow: TextOverflow.visible,
          ),
        )
      ],
    );
  }
}

class HeadLineWidget extends StatelessWidget {
  final String? title;

  const HeadLineWidget({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        '$title:',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
