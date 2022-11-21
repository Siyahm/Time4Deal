import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/home_controller/home_controller.dart';
import 'package:time4deal/controller/wish_list_controller/wish_list_controller.dart';
import 'package:time4deal/helpers/app_text_styles.dart';
import 'package:time4deal/models/product_model/product_model.dart';

class ItemName extends StatelessWidget {
  const ItemName({
    Key? key,
    required this.index,
    required this.model,
  }) : super(key: key);

  final int index;

  final ProductModel? model;

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context, listen: false);
    final wishListController =
        Provider.of<WishListController>(context, listen: false);
    return Row(
      children: [
        const Text(
          'Space Black Stinless\nSteel Case',
          style: AppTextStyles.head1,
        ),
        const Spacer(),
        Consumer<HomeController>(
          builder: (context, value, child) => IconButton(
            onPressed: () {
              value.addFavourite(index);
              if (homeController.trendingProductItems[index].isFavourite ==
                  true) {
                wishListController.addToWishList(model!);
              } else {
                wishListController.removeFromWishList(model!);
              }
            },
            icon: Icon(
              homeController.trendingProductItems[index].isFavourite == false
                  ? Icons.favorite_outline
                  : Icons.favorite_outlined,
            ),
          ),
        )
      ],
    );
  }
}
