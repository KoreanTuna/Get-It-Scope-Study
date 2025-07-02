import 'package:flutter/material.dart';
import 'package:get_it_scope_study/environment/getit/getit.dart';
import 'package:go_router/go_router.dart';

void main() async {
  setUpGetItConfig();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: locator<GoRouter>());
  }
}
