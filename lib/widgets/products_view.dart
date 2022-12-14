import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/product_details_controller/product_details_controller.dart';
import 'package:time4deal/controller/wish_list_controller/wish_list_controller.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/sized_boxes.dart';
import 'package:time4deal/models/product_model/product_model.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({
    Key? key,
    required this.image,
    required this.company,
    required this.watchName,
    required this.isFavourite,
    // required this.index,
    this.productId,
    this.model,
    this.rating,
  }) : super(key: key);
  final String? image;
  final String? company;
  final String? watchName;

  final bool? isFavourite;
  // final int index;

  final String? rating;
  final ProductModel? model;
  final String? productId;

  @override
  Widget build(BuildContext context) {
    // final homeController = Provider.of<HomeController>(context);
    final productDetailsController =
        Provider.of<ProductDetailsContoller>(context);
    // final wishListController = Provider.of<WishListController>(context);

    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () async {
        // homeController.onTapCard(context, index,
        //     homeController.trendingProductItems[index].id, model);
        await productDetailsController.getAProduct(productId!, context);
      },
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Card(
              color: AppColors.themeColor,
              child: Container(
                height: size.height * 0.24,
                // width: size.width * 0.38,
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: NetworkImage(image!),
                  ),
                ),
                // child: Image(
                //   image: AssetImage(image),
                // ),
              ),
            ),
            Consumer<WishListController>(
              builder: (context, value, child) => IconButton(
                onPressed: () async {
                  log(model!.id.toString());
                  await value.addOrRemoveWishListItem(model!.id);
                  value.getWishList();
                  // log(value.wishListItemList.toString());
                  // value.addFavourite(index);
                  // if (homeController.trendingProductItems[index].isFavourite ==
                  //     true) {
                  //   wishListController.addToWishList(model!);
                  // } else {
                  //   wishListController.removeFromWishList(model!);
                  // }
                },
                icon: Icon(
                  value.wishListProductIds.contains(productId)
                      ? Icons.favorite_outlined
                      : Icons.favorite_outline,
                  color: value.wishListProductIds.contains(productId)
                      ? AppColors.redColor
                      : AppColors.whiteColor,
                ),
              ),
            ),
          ],
        ),
        Text(
          company ?? "Brand",
          style: TextStyle(
            color: AppColors.dimWhiteColor.withOpacity(0.7),
            fontSize: 12,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          watchName!,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: const TextStyle(color: AppColors.whiteColor, fontSize: 14),
        ),
        SizedBoxes.heightBox10,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('₹ 499'),
            rating != null
                ? SizedBox(
                    child: RatingBar.builder(
                        allowHalfRating: true,
                        ignoreGestures: true,
                        itemSize: 20,
                        initialRating: double.parse(rating!),
                        direction: Axis.horizontal,
                        glowRadius: 1,
                        itemCount: 5,
                        itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.green,
                            ),
                        onRatingUpdate: (rating) {}),
                  )
                : const SizedBox(),
          ],
        ),
      ]),
    );
  }
}
