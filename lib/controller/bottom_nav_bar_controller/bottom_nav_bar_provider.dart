import 'package:flutter/cupertino.dart';
import 'package:time4deal/view/home/home.dart';
import 'package:time4deal/view/orders/my_orders.dart';
import 'package:time4deal/view/profile/my_profile.dart';
import 'package:time4deal/view/wish_list/wish_list.dart';

class BottomNavBarProvider with ChangeNotifier {
  int selectedIndex = 0;

  final List bottomNavScreens = [
    const HomeScreen(),
    const MyWishList(),
    const MyOrders(),
    const MyProfile(),
  ];
  void onItemTaped(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  Future<bool>? navBarWillPop() {
    if (selectedIndex != 0) {
      selectedIndex = 0;
      notifyListeners();
    }
    return null;
  }
}
