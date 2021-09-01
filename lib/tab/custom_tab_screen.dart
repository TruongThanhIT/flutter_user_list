import 'package:flutter/material.dart';

class CustomTabScreen extends StatefulWidget {
  const CustomTabScreen({Key? key}) : super(key: key);

  @override
  _CustomTabScreenState createState() => _CustomTabScreenState();
}

class _CustomTabScreenState extends State<CustomTabScreen>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(
      text: 'LEFT',
    ),
    Tab(
      text: 'MIDDLE',
    ),
    Tab(
      text: 'RIGHT',
    ),
  ];

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: myTabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom tab'),
        bottom: TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          final String label = tab.text?.toLowerCase() ?? '';
          return Center(
            child: Text(
              'This is $label tab',
              style: const TextStyle(fontSize: 36),
            ),
          );
        }).toList(),
      ),
    );
  }
}
