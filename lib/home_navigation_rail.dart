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
              leading: ElevatedButton(
                onPressed: (() async {
                  context.go('/login');
                }),
                child: const Text(
                  "ログアウト",
                ),
              ),
              backgroundColor: Color.fromARGB(255, 194, 227, 255),
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
              child: homeWidget,
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
          builder: (context, state) => const HomePage(),
          routes: <RouteBase>[
            GoRoute(
                path: 'home/article',
                builder: (context, state) => const ArticlePage()),
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
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text('ログイン'))),
    );
  }
}

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('ユーザー'),
      ),
    );
  }
}

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('アーティスト'),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
    return const Scaffold(
      body: Center(
        child: Text('設定'),
      ),
    );
  }
}
