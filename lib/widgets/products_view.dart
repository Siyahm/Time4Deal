import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/home_controller/home_controller.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/models/product_model/product_model.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({
    Key? key,
    required this.image,
    required this.company,
    required this.watchName,
    required this.isFavourite,
    required this.index,
    required this.model,
    this.rating,
  }) : super(key: key);
  final String? image;
  final String? company;
  final String? watchName;

  final bool? isFavourite;
  final int index;
  final ProductModel? model;
  final String? rating;

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    // final wishListController = Provider.of<WishListController>(context);

    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        homeController.onTapCard(context, index, model);
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
            Consumer<HomeController>(
              builder: (context, value, child) => IconButton(
                onPressed: () {
                  // value.addFavourite(index);
                  // if (homeController.trendingProductItems[index].isFavourite ==
                  //     true) {
                  //   wishListController.addToWishList(model!);
                  // } else {
                  //   wishListController.removeFromWishList(model!);
                  // }
                },
                icon: const Icon(
                  Icons.favorite,
                  color: AppColors.whiteColor,
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
        Text(
          watchName!,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: const TextStyle(color: AppColors.whiteColor, fontSize: 14),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('₹ 499'),
            rating != null
                ? Container(
                    color: AppColors.greenColor,
                    child: Row(
                      children: [
                        Text(
                          rating!,
                          style: const TextStyle(color: AppColors.whiteColor),
                        ),
                        Icon(
                          Icons.star,
                          color: AppColors.whiteColor,
                          size: size.height * 0.025,
                        )
                      ],
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ]),
    );
  }
}
