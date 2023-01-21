import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeNavigationRail extends StatelessWidget {
  const HomeNavigationRail({
    required this.homeWidget,
    Key? key,
  }) : super(key: key);

  final Widget homeWidget;
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
              backgroundColor: Colors.black,
              extended: true,
              destinations: [
                NavigationRailDestination(
                  icon: Container(),
                  label: const Text(
                    "ダッシュボード",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                NavigationRailDestination(
                  icon: Container(),
                  label: const Text(
                    "アーティスト一覧",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                NavigationRailDestination(
                  icon: Container(),
                  label: const Text(
                    "ユーザー一覧",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                NavigationRailDestination(
                  icon: Container(),
                  label: const Text(
                    "現在の設定",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
              selectedIndex: calculateSelectedIndex(context),
              onDestinationSelected: (int index) =>
                  onItemTapped(index, context)),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: homeWidget,
            ),
          )
        ],
      ),
    );
  }

  static int calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith('/home/artist')) {
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
        GoRouter.of(context).go('/home/artist');
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

class PageRouter {
  static final GoRouter router =
      GoRouter(initialLocation: '/', routes: <RouteBase>[
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
    ),
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return HomeNavigationRail(homeWidget: child);
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (context, state) => const DashBoard(),
          routes: <RouteBase>[
            GoRoute(
                path: 'home/artist',
                builder: (context, state) => const ArtistPage()),
            GoRoute(
                path: 'home/user',
                builder: (context, state) => const UserPage()),
            GoRoute(
                path: 'home/setting',
                builder: (context, state) => const SettingPage()),
          ],
        ),
      ],
    )
  ]);
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ログイン'),
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text('login'))),
    );
  }
}

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ユーザー'),
      ),
      body: const Center(
        child: Text('ユーザー'),
      ),
    );
  }
}

class ArtistPage extends StatelessWidget {
  const ArtistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('アーティスト'),
      ),
      body: const Center(
        child: Text('アーティスト'),
      ),
    );
  }
}

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ダッシュボード'),
      ),
      body: Center(
        child: Text('ダッシュボード'),
      ),
    );
  }
}

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: const Center(
        child: Text('設定'),
      ),
    );
  }
}
