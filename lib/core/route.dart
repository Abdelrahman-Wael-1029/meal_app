import 'package:flutter/material.dart';
import '../view/home_layout/desktop/desktop_layout.dart';
import 'app_messages.dart';
import '../view/splash/screens/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case DesktopLayout.routeName:
        return MaterialPageRoute(builder: (_) =>  DesktopLayout());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text(AppMessages.notFoundPage),
          ),
        );
      },
    );
  }
}
