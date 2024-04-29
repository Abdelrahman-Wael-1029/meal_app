import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'data/model/cart.dart';
import 'data/model/favorite.dart';
import 'repository/cart/cart_repository.dart';
import 'repository/favorite/favorite_repository.dart';
import 'viewmodel/cart/cubit/cart_cubit.dart';
import 'viewmodel/favorite/cubit/favorite_cubit.dart';
import 'package:path_provider/path_provider.dart';
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
  final directory = await getApplicationDocumentsDirectory();
  Hive
    ..init(directory.path)
    ..registerAdapter(CartAdapter())
  ..registerAdapter(FavoriteAdapter());


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
        BlocProvider(
          create: (context) => FavoriteCubit(
            favoriteRepository: FavoriteRepository(),
          )..getFavorites(),
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
