import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../viewmodel/cart/cubit/cart_cubit.dart';
import '../../../viewmodel/cart/cubit/cart_state.dart';
import '../../cart/screen/cart_screen.dart';
import '../../favorite/screen/favorite_screen.dart';
import '../../profile/screen/profile_screen.dart';
import '../../../viewmodel/home/cubit/home_cubit.dart';
import '../../../viewmodel/home/cubit/home_state.dart';
import '../../home/screen/home_screen.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';

class DesktopLayout extends StatefulWidget {
  static const routeName = '/home';
  const DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  SideMenuController sideMenu = SideMenuController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  List<Widget> pages = [
    const HomeScreen(),
    const FavoriteScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            var cubit = context.read<HomeCubit>();
            return BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SideMenu(
                      displayModeToggleDuration:
                          const Duration(milliseconds: 200),
                      controller: sideMenu,
                      collapseWidth: 700,
                      style: SideMenuStyle(
                        backgroundColor: Colors.grey[200],
                        selectedIconColor: Colors.white,
                        selectedTitleTextStyle:
                            Theme.of(context).textTheme.bodyLarge,
                        unselectedTitleTextStyle:
                            Theme.of(context).textTheme.bodyLarge,
                        selectedColor: Theme.of(context).primaryColor,
                      ),
                      showToggle: true,
                      // List of SideMenuItem to show them on SideMenu
                      items: [
                        SideMenuItem(
                          title: 'home',
                          onTap: (index, sideMenuController) {
                            sideMenu.changePage(index);
                            cubit.changeIndex(index);
                          },
                          icon: const Icon(Icons.home),
                        ),
                        SideMenuItem(
                          title: 'favorite',
                          onTap: (index, sideMenuController) {
                            sideMenu.changePage(index);
                            cubit.changeIndex(index);
                          },
                          icon: const Icon(Icons.favorite),
                        ),
                        SideMenuItem(
                          title: 'cart',
                          onTap: (index, sideMenuController) {
                            sideMenu.changePage(index);
                            cubit.changeIndex(index);
                          },
                          icon: const Icon(Icons.shopping_cart),
                        ),
                        SideMenuItem(
                          title: 'profile',
                          onTap: (index, sideMenuController) {
                            sideMenu.changePage(index);
                            cubit.changeIndex(index);
                          },
                          icon: const Icon(Icons.person),
                        ),
                      ],
                    ),
                    Expanded(child: pages[sideMenu.currentPage]),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
