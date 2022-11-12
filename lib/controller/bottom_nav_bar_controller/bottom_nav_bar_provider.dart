import 'package:flutter/cupertino.dart';
import 'package:time4deal/view/cart/my_cart.dart';
import 'package:time4deal/view/home/home.dart';
import 'package:time4deal/view/orders/my_orders.dart';
import 'package:time4deal/view/profile/my_profile.dart';
import 'package:time4deal/view/wish_list/wish_list.dart';

class BottomNavBarProvider with ChangeNotifier {
  int selectedIndex = 0;

  final List bottomNavScreens = [
    HomeScreen(),
    const MyWishList(),
    const MyOrders(),
    const MyProfile(),
  ];
  void onItemTaped(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
