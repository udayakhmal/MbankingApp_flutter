import 'package:flutter/material.dart';
import '../utils/route_utils.dart';
import 'package:money_app/features/dashboard/dashboard/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Converted 'key' to a super parameter

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DashboardScreen(),
      onGenerateRoute: RouteUtils.generateRoute,
    );
  }
}