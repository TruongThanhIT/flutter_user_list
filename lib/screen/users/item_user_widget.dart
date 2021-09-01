import 'package:flutter_user_list/ext/string_extension.dart';
import 'package:flutter_user_list/models/user.dart';
import 'package:flutter/material.dart';

class ItemUserWidget extends StatelessWidget {
  final User? user;
  final Function(User?)? onItemClick;

  const ItemUserWidget({Key? key, this.user, this.onItemClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onItemClick != null) {
          onItemClick!(user);
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                ClipOval(
                  child: FadeInImage.assetNetwork(
                      placeholder: "assets/images/ic_user.png",
                      image: user?.picture ?? '',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    height: 40,
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: Text(
                    '${user?.title?.capitalize()} ${user?.firstName} ${user?.lastName}',
                    style: TextStyle(
                        color: Colors.blueAccent, fontWeight: FontWeight.bold),
                  ),
                ),
                Icon(
                  Icons.navigate_next,
                  size: 15,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
