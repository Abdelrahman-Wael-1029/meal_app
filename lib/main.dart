import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();
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
      builder: (context, child) {
        return BlocProvider(
          create: (context) => HomeCubit(
            mealRepository: MealRepository(MealsApi()),
            categoryRepository: CategoryRepository(CategoryApi()),
          )
            ..getCategories()
            ..getMeals(),
          child: MaterialApp(
            title: 'Flutter Demo',
            onGenerateRoute: RouteGenerator.generateRoute,
            home: const SplashScreen(),
            theme: appTheme(),
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
