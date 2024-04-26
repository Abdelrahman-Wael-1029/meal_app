import 'package:flutter/material.dart';
import '../../home/layout/home_screen.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';

class DesktopLayout extends StatefulWidget {
  static const routeName = '/home';
  const DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            SideMenu(
              displayModeToggleDuration: const Duration(milliseconds: 200),
              // Page controller to manage a PageView
              controller: sideMenu,
              collapseWidth: 800,
              style: SideMenuStyle(
                backgroundColor: Colors.grey[200],
                selectedIconColor: Colors.white,
                selectedTitleTextStyle: Theme.of(context).textTheme.bodyLarge,
                unselectedTitleTextStyle: Theme.of(context).textTheme.bodyLarge,
                selectedColor: Theme.of(context).primaryColor,
              ),
              showToggle: true,
              // List of SideMenuItem to show them on SideMenu
              items: [
                SideMenuItem(
                  title: 'home',
                  onTap: (index, sideMenuController) {
                    sideMenu.changePage(index);
                  },
                  icon: const Icon(Icons.home),
                ),
                SideMenuItem(
                  title: 'favorite',
                  onTap: (index, sideMenuController) {
                    sideMenu.changePage(index);
                  },
                  icon: const Icon(Icons.favorite),
                ),
                SideMenuItem(
                  title: 'cart',
                  onTap: (index, sideMenuController) {
                    sideMenu.changePage(index);
                  },
                  icon: const Icon(Icons.shopping_cart),
                ),

                SideMenuItem(
                  title: 'profile',
                  onTap: (index, sideMenuController) {
                    sideMenu.changePage(index);
                  },
                  icon: const Icon(Icons.person),
                ),
              ],
            ),
            const Expanded(child: HomeScreen()),
          ],
        ),
      ),
    );
  }
}
