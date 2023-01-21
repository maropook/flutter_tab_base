import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeNavigationRail extends StatelessWidget {
  const HomeNavigationRail({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigationRail(
              trailing: ElevatedButton(
                onPressed: (() async {
                  context.go('/login');
                }),
                child: const Text(
                  "ログアウト",
                ),
              ),
              backgroundColor: const Color.fromARGB(255, 194, 227, 255),
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text(
                    "ホーム",
                  ),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.article),
                  label: Text(
                    "記事一覧",
                  ),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.face),
                  label: Text(
                    "ユーザー一覧",
                  ),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings),
                  label: Text(
                    "設定",
                  ),
                ),
              ],
              selectedIndex: calculateSelectedIndex(context),
              onDestinationSelected: (int index) =>
                  onItemTapped(index, context)),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: child,
            ),
          )
        ],
      ),
    );
  }

  static int calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith('/home/article')) {
      return 1;
    }
    if (location.startsWith('/home/user')) {
      return 2;
    }
    if (location.startsWith('/home/setting')) {
      return 3;
    }

    return 0;
  }

  void onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/');
        break;
      case 1:
        GoRouter.of(context).go('/home/article');
        break;
      case 2:
        GoRouter.of(context).go('/home/user');
        break;
      case 3:
        GoRouter.of(context).go('/home/setting');
        break;
    }
  }
}
