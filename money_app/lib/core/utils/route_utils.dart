import 'package:flutter/material.dart';
import '../../features/dashboard/dashboard/dashboard_screen.dart';
import '../../features/payment/screens/payment_screen.dart';
import '../../features/qr_code/screens/qr_screen.dart';

class RouteUtils {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case '/payment':
        return MaterialPageRoute(builder: (_) => const PaymentScreen());
      case '/qr_code':
        return MaterialPageRoute(builder: (_) => const QrScannerScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
