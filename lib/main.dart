import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'page01.dart';
import 'page02.dart';

enum TabItem { page01, page02 }

Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
  TabItem.page01: GlobalKey<NavigatorState>(),
  TabItem.page02: GlobalKey<NavigatorState>(),
};
Map<TabItem, Map<String, WidgetBuilder>> _routeBuilders = {
  TabItem.page01: page01RouteBuilders,
  TabItem.page02: page02RouteBuilders,
};
final Map<String, WidgetBuilder> page01RouteBuilders = {
  '/': (context) => Page01(),
};
final Map<String, WidgetBuilder> page02RouteBuilders = {
  '/': (context) => Page02(),
};

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TabItem _currentTab = TabItem.page01;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: Stack(
        children: <Widget>[
          _buildOffstageNavigator(TabItem.page01),
          _buildOffstageNavigator(TabItem.page02),
        ],
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: Navigator(
        key: _navigatorKeys[tabItem],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) =>
                _routeBuilders[tabItem][routeSettings.name](context),
          );
        },
      ),
    );
  }
}
