import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app/common/networks/dio_client.dart';
import 'package:meal_app/core/route.dart';
import 'package:meal_app/core/theme_manager.dart';
import 'package:meal_app/view/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  DioClient.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp._();

  static const MyApp _instance = MyApp._();
  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: RouteGenerator.generateRoute,
        home: const SplashScreen(),
        theme: appTheme(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
