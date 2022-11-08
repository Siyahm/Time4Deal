import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/bottom_nav_bar_controller/bottom_nav_bar_provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavBarProvider>(context);
    return Scaffold(
      body: Consumer<BottomNavBarProvider>(
        builder: (context, value, child) =>
            value.bottomNavScreens[bottomNavProvider.selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavProvider.selectedIndex,
        onTap: (index) {
          log(index.toString());
          bottomNavProvider.onItemTaped(index);
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Cart',
            icon: Icon(Icons.shopping_cart_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Orders',
            icon: Icon(Icons.shopping_bag_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person_outline),
          ),
        ],
      ),
    );
  }
}
