import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/constants/api_endpoints.dart';
import 'package:time4deal/constants/app_urls.dart';
import 'package:time4deal/controller/wish_list_controller/wish_list_controller.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/app_padding.dart';
import 'package:time4deal/view/wish_list/widgets/wish_list_items.dart';
import 'package:time4deal/widgets/custom_app_bar_trailing.dart';
import 'package:time4deal/widgets/custome_app_bar.dart';

class MyWishList extends StatelessWidget {
  const MyWishList({super.key});

  @override
  Widget build(BuildContext context) {
    // final wishListController1 = Provider.of<WishListController>(context);
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   wishListController.getWishList();
    // });
    // final homeController = Provider.of<HomeController>(context);
    return Scaffold(
      appBar: const CustomeAppBar(
        leadingWidget: SizedBox(),
        trailing: CustomAppbarTrailing(),
      ),
      body: Padding(
        padding: AppPadding.allPadding8,
        child: Consumer<WishListController>(
          builder: (context, value, child) => value.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : value.wishListItemList.isEmpty
                  ? const Center(
                      child: Text('No items added'),
                    )
                  : ListView.separated(
                      itemCount: value.wishListItemList.length,
                      itemBuilder: (context, index) => WishListItemTile(
                        closeFunction: () async {
                          await value.addOrRemoveWishListItem(
                              value.wishListItemList[index].id);
                          value.getWishList();
                          log(index.toString());
                        },
                        image:
                            '${AppUrls.networkImageMainUrl}products/${value.wishListItemList[index].image[0]}',
                        name: value.wishListItemList[index].name,
                        company: 'No brand',
                        rate: value.wishListItemList[index].price,
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
      ),
    );
  }
}
