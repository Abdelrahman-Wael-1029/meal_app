import 'package:flutter/material.dart';

import '../data/model/category.dart';
import '../data/model/meal.dart';
import '../data/model/meal_category.dart';
import '../view/cart/screen/cart_screen.dart';
import '../view/category_details/screen/category_details.dart';
import '../view/favorite/screen/favorite_screen.dart';
import '../view/home_layout/desktop/desktop_layout.dart';
import '../view/meal_details/screens/meal_details.dart';
import '../view/profile/screen/profile_screen.dart';
import '../view/splash/screens/splash_screen.dart';
import 'app_messages.dart';

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
      case MealDetails.routeName:
        final args = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => MealDetails(meal: args as Meal),
        );
      case CategoryDetails.routeName:
        final args = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => CategoryDetails(
            category: (args as Map<String, dynamic>)['category'] as Category,
            meals: args['meals'] as List<MealCategory>,
          ),
        );
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
