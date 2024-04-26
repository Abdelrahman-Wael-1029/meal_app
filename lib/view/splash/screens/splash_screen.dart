import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meal_app/core/response_manager.dart';
import 'package:meal_app/view/home_layout/mobile/mobile_layout.dart';
import '../../home_layout/desktop/desktop_layout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(const Duration(seconds: 3), () {
      if(getOs() == 'web' || getOs() == 'windows' || getOs() == 'macos' || getOs() == 'linux'){
        Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const DesktopLayout()));
          return;
      }
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const  MobileLayout()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Theme.of(context).primaryColor,
        child: Image.asset(
          'assets/images/splash.png',
          // fit: BoxFit.fill,
        ),
      ),
    );
  }
}
