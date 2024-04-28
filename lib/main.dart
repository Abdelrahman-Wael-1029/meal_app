import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:meal_app/data/model/cart.dart';
import 'package:meal_app/repository/cart/cart_repository.dart';
import 'package:meal_app/viewmodel/cart/cubit/cart_cubit.dart';
import 'bloc_observer.dart';
import 'data/api/category/category_api.dart';
import 'data/api/meals/meals_api.dart';
import 'repository/category/category_repository.dart';
import 'repository/meal/meal_repository.dart';
import 'viewmodel/home/cubit/home_cubit.dart';
import 'common/networks/dio_client.dart';
import 'core/route.dart';
import 'core/theme_manager.dart';
import 'view/splash/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var path = Directory.current.path;
  Hive
    ..init(path)
    ..registerAdapter(CartAdapter());
    // clear data
    // await Hive.deleteBoxFromDisk('cart');

  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();
  DioClient.init();
  runApp(
    // multi bloc provider
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(
            mealRepository: MealRepository(MealsApi()),
            categoryRepository: CategoryRepository(CategoryApi()),
          )
            ..getCategories()
            ..getMeals(),
        ),
        BlocProvider(
          create: (context) => CartCubit(
            cartRepository: CartRepository(),
          )..getCart(),
        ),
      ],
      child: MyApp(),
    ),
   
  );
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
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          onGenerateRoute: RouteGenerator.generateRoute,
          home: const SplashScreen(),
          theme: appTheme(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
