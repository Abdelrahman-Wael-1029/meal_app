import 'package:flutter/material.dart';
import 'package:meal_app/view/home_layout/layout/home_layout.dart';
import 'app_messages.dart';
import '../view/splash/screens/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case HomeLayout.routeName:
        return MaterialPageRoute(builder: (_) => const HomeLayout());
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
