import 'package:flutter/material.dart';
import 'package:meal_app/view/cart/screen/cart_screen.dart';
import 'package:meal_app/view/favorite/screen/favorite_screen.dart';
import 'package:meal_app/view/profile/screen/profile_screen.dart';
import '../view/home_layout/desktop/desktop_layout.dart';
import 'app_messages.dart';
import '../view/splash/screens/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case DesktopLayout.routeName:
        return MaterialPageRoute(builder: (_) => const DesktopLayout());

      case FavoriteScreen.routeName:
        return MaterialPageRoute(builder: (_) => const FavoriteScreen());
      case CartScreen.routeName:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case ProfileScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
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
