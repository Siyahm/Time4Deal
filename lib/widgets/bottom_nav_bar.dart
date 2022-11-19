import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/bottom_nav_bar_controller/bottom_nav_bar_provider.dart';
import 'package:time4deal/helpers/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    // final bottomNavProvider = Provider.of<BottomNavBarProvider>(context);
    return Consumer<BottomNavBarProvider>(
      builder: (context, value, child) => WillPopScope(
        onWillPop: () async {
          await value.navBarWillPop();
          return false;
        },
        child: Scaffold(
          body: Consumer<BottomNavBarProvider>(
            builder: (context, value, child) =>
                value.bottomNavScreens[value.selectedIndex],
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: AppColors.themeColor,
            unselectedItemColor: AppColors.whiteColor.withOpacity(0.35),
            currentIndex: value.selectedIndex,
            onTap: (index) {
              log(index.toString());
              value.onItemTaped(index);
            },
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home_filled),
              ),
              BottomNavigationBarItem(
                label: 'Wish List',
                icon: Icon(Icons.favorite_outline_outlined),
                activeIcon: Icon(Icons.favorite_rounded),
              ),
              BottomNavigationBarItem(
                label: 'Orders',
                icon: Icon(Icons.shopping_bag_outlined),
                activeIcon: Icon(Icons.shopping_bag),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
