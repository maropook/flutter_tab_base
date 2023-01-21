import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'router/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '遷移のサンプル',
            ),
            ElevatedButton(
              child: const Text('一覧へ'),
              onPressed: () {
                context.go('/home/list');
              },
            ),
            ElevatedButton(
              child: const Text('pushで詳細へ'),
              onPressed: () {
                context.push('/home/list/detail');
              },
            ),
            ElevatedButton(
              child: const Text('goで詳細へ'),
              onPressed: () {
                context.go('/home/list/detail');
              },
            ),
            ElevatedButton(
              child: const Text('記事一覧へ'),
              onPressed: () {
                context.go('/article/list');
              },
            ),
            ElevatedButton(
              child: const Text('記事詳細へ'),
              onPressed: () {
                context.go('/article/list/detail');
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
