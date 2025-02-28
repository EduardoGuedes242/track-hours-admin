import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:panel_admin/src/home/homepage.dart';
import 'package:panel_admin/src/login/screen/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(
        path: '/dashboard',
        builder:
            (context, state) =>
                Homepage(body: SizedBox(child: Text('DASHBOARD'))),
      ),
      GoRoute(
        path: '/employee',
        builder:
            (context, state) =>
                Homepage(body: SizedBox(child: Text('employee'))),
      ),
      GoRoute(
        path: '/menager-hours',
        builder:
            (context, state) =>
                Homepage(body: SizedBox(child: Text('menager-hours'))),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Track Hours',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: _router,
    );
  }
}
