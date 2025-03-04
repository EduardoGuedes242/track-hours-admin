import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:panel_admin/src/home/dashboard/dashboard.dart';
import 'package:panel_admin/src/home/employee/screen/form_employee.dart';
import 'package:panel_admin/src/home/employee/screen/list_employee.dart';
import 'package:panel_admin/src/home/homepage.dart';
import 'package:panel_admin/src/home/menager_hours/screen/menager_hours.dart';
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
        builder: (context, state) => Homepage(body: DashboardPage()),
      ),
      GoRoute(
        path: '/employee',
        builder: (context, state) => Homepage(body: ListEmployeePage()),
      ),
      GoRoute(
        path: '/employee-form',
        builder: (context, state) {
          return Homepage(body: FormEmployeePage(employeeId: null));
        },
      ),
      GoRoute(
        path: '/employee-form/:id',
        builder: (context, state) {
          final id = state.pathParameters['id'];
          return Homepage(body: FormEmployeePage(employeeId: id));
        },
      ),
      GoRoute(
        path: '/menager-hours',
        builder: (context, state) => Homepage(body: MenagerHoursPage()),
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
