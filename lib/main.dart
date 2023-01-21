import 'package:flutter/material.dart';
import 'package:flutter_tab_base/page_router.dart';

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
