import 'package:flutter/material.dart';
import 'package:flutter_tab_base/each_screen.dart';
import 'package:flutter_tab_base/home_navigation_rail.dart';
import 'package:go_router/go_router.dart';

class PageRouter {
  static final GoRouter router =
      GoRouter(initialLocation: '/login', routes: <RouteBase>[
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
    ),
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return HomeNavigationRail(child: child);
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
