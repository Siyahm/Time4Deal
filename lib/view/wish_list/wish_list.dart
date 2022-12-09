import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/wish_list_controller/wish_list_controller.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/app_padding.dart';
import 'package:time4deal/view/wish_list/widgets/wish_list_items.dart';
import 'package:time4deal/widgets/custom_app_bar_leading.dart';
import 'package:time4deal/widgets/custom_app_bar_trailing.dart';
import 'package:time4deal/widgets/custome_app_bar.dart';

class MyWishList extends StatelessWidget {
  const MyWishList({super.key});

  @override
  Widget build(BuildContext context) {
    final wishListController = Provider.of<WishListController>(context);
    // final homeController = Provider.of<HomeController>(context);
    return Scaffold(
      appBar: const CustomeAppBar(
        leadingWidget: CustomAppBarLeadingWidget(),
        trailing: CustomAppbarTrailing(),
      ),
      body: Padding(
        padding: AppPadding.allPadding8,
        child: wishListController.wishListItemList.isEmpty
            ? const Center(
                child: Text('No items added'),
              )
            : ListView.separated(
                itemCount: wishListController.wishListItemList.length,
                itemBuilder: (context, index) => WishListItemTile(
                  closeFunction: () {
                    wishListController.removeFromWishList(
                        wishListController.wishListItemList[index]);
                    log(index.toString());
                  },
                  image: wishListController.wishListItemList[index].image,
                  name: wishListController.wishListItemList[index].name,
                  company: 'No brand',
                  rate: wishListController.wishListItemList[index].price,
                  // color: wishListController.wishListItemList[index].color!,
                  index: index,
                ),
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    thickness: 1,
                    color: AppColors.themeColor,
                  );
                },
              ),
      ),
    );
  }
}
