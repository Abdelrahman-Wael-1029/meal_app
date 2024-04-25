import 'package:flutter/material.dart';
import 'package:meal_app/view/home/layout/home_screen.dart';

class HomeLayout extends StatelessWidget {
  static const routeName = '/home';
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: const HomeScreen()),
    );
  }
}
