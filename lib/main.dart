import 'package:flutter/material.dart';
import 'package:flutter_tab_base/home_navigation_rail.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: PageRouter.router,
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('一覧へ'),
              onPressed: () {
                context.go('/home');
              },
            ),
            ElevatedButton(
              child: const Text('詳細へ'),
              onPressed: () {
                context.go('/home/detail');
              },
            ),
            ElevatedButton(
              child: const Text('記事一覧へ'),
              onPressed: () {
                context.go('/article/');
              },
            ),
            ElevatedButton(
              child: const Text('記事詳細へ'),
              onPressed: () {
                context.go('/article/detail');
              },
            ),
            ElevatedButton(
              child: const Text('利用規約へ'),
              onPressed: () {
                context.go('/rule');
              },
            ),
          ],
        ),
      ),
    );
  }
}
