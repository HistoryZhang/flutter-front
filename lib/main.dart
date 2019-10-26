import 'package:flutter/material.dart';
import 'package:fun_android/tab/AlbumPage.dart';
import 'package:fun_android/tab/FeedPage.dart';
import 'package:fun_android/tab/OrganizationPage.dart';
import 'package:fun_android/tab/UserPage.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => new MaterialApp(home: HomeTabPage());
}

class HomeTabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  /// 相当于TabLayout 和 ViewPage
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new TabBarView(controller: controller, children: <Widget>[
        new FeedPage(),
        new OrganizationPage(),
        new AlbumPage(),
        new UserPage()
      ]),
      bottomNavigationBar: new Material(
        color: Colors.blue,
        child: new TabBar(
          controller: controller,
          tabs: <Tab>[
            new Tab(text: "首页", icon: new Icon(Icons.home)),
            new Tab(text: "列表", icon: new Icon(Icons.list)),
            new Tab(text: "信息", icon: new Icon(Icons.message)),
            new Tab(text: "我的", icon: new Icon(Icons.payment)),
          ],
          indicatorWeight: 0.1,
        ),
      ),
    );
  }
}
