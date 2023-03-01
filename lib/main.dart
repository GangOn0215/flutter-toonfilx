import 'package:flutter/material.dart';
import 'package:toonflix/utils/tab_item.dart';
import 'package:toonflix/utils/tab_navigator.dart';
import 'package:toonflix/widgets/bottom_navigation.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final _commonBackgroundColor = Colors.black.withOpacity(0.7);
  final _commonFontColor = const Color(0xFFE75480);

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.amber,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 1,
          backgroundColor: _commonBackgroundColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: _commonFontColor,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: _commonBackgroundColor,
          titleTextStyle: TextStyle(
            color: _commonFontColor,
            fontSize: 20,
          ),
        ),
      ),
      home: const RoutePage(),
    );
  }
}

class RoutePage extends StatefulWidget {
  const RoutePage({super.key});

  @override
  State<RoutePage> createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  TabItem _currentTab = TabItem.home;

  final _navigatorKeys = {
    TabItem.wallets: GlobalKey<NavigatorState>(),
    TabItem.study: GlobalKey<NavigatorState>(),
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.pomodoro: GlobalKey<NavigatorState>(),
    TabItem.toonflix: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // 네비게이션 탭을 누르면, 해당 네비의 첫 스크린으로 이동!
      _navigatorKeys[tabItem]!.currentState!.popUntil(
            (route) => route.isFirst,
          );
    } else {
      setState(
        () => _currentTab = tabItem,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentTab]!.currentState!.maybePop();

        if (isFirstRouteInCurrentTab) {
          // 메인화면 x
          if (_currentTab != TabItem.home) {
            _selectTab(TabItem.home);

            return false;
          }
        }

        return true;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _buildOffstageNavigator(TabItem.wallets),
            _buildOffstageNavigator(TabItem.study),
            _buildOffstageNavigator(TabItem.home),
            _buildOffstageNavigator(TabItem.pomodoro),
            _buildOffstageNavigator(TabItem.toonflix),
          ],
        ),
        bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
