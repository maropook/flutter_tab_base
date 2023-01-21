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
