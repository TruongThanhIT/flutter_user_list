import 'package:flutter/material.dart';

class TabBarScreen extends StatelessWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Image.asset('assets/images/ic_user.png'),
                ),
                Tab(
                  text: 'Radio',
                  icon: Icon(
                    Icons.radio,
                    color: Colors.white,
                  ),
                  iconMargin: EdgeInsets.only(bottom: 10.0),
                ),
                Tab(
                  text: 'Gift',
                  icon: Icon(
                    Icons.card_giftcard,
                    color: Colors.white,
                  ),
                  iconMargin: EdgeInsets.only(bottom: 10.0),
                ),
              ],
            ),
            title: Center(child: const Text('Tab demo')),
          ),
          body: const TabBarView(children: [
            Center(
                child: Text(
              'This is Android Image Tab',
              style: TextStyle(fontSize: 32),
            )),
            Center(
                child: Text(
              'This is Radio Tab',
              style: TextStyle(fontSize: 32),
            )),
            Center(
                child: Text(
              'This is Gift Tab',
              style: TextStyle(fontSize: 32),
            )),
          ]),
        ),
      ),
    );
  }
}
