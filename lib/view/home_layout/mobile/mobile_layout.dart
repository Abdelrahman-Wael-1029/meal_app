import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cart/screen/cart_screen.dart';
import '../../favorite/screen/favorite_screen.dart';
import '../../../viewmodel/home/cubit/home_cubit.dart';
import '../../../viewmodel/home/cubit/home_state.dart';
import '../../home/screen/home_screen.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';

class MobileLayout extends StatefulWidget {
  static const routeName = '/home';
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  SideMenuController sideMenu = SideMenuController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  List<Widget> pages = [
    const HomeScreen(),
    const FavoriteScreen(),
    const CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = context.read<HomeCubit>();
        return Scaffold(
          body: SafeArea(
            child: pages[cubit.currentIndex],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),

            ],
          ),
        );
      },
    );
  }
}
