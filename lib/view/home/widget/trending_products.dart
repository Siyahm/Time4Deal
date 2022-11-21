import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/home_controller/home_controller.dart';
import 'package:time4deal/controller/wish_list_controller/wish_list_controller.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/models/product_model/product_model.dart';
import 'package:time4deal/routes/rout_names.dart';

class TrendingProduct extends StatelessWidget {
  const TrendingProduct({
    Key? key,
    required this.image,
    required this.company,
    required this.watchName,
    required this.isFavourite,
    required this.index,
    required this.model,
  }) : super(key: key);
  final String? image;
  final String? company;
  final String? watchName;

  final bool? isFavourite;
  final int index;
  final ProductModel? model;

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    final wishListController = Provider.of<WishListController>(context);

    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        homeController.onTapCard(context, index, model);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                      image: AssetImage(image!),
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
                    value.addFavourite(index);
                    if (homeController
                            .trendingProductItems[index].isFavourite ==
                        true) {
                      wishListController.addToWishList(model!);
                    } else {
                      wishListController.removeFromWishList(model!);
                    }
                  },
                  icon: value.trendingProductItems[index].isFavourite == false
                      ? const Icon(
                          Icons.favorite_outline,
                          color: AppColors.dimWhiteColor,
                        )
                      : const Icon(
                          Icons.favorite,
                          color: AppColors.whiteColor,
                        ),
                ),
              ),
            ],
          ),
          Text(
            company!,
            style: TextStyle(
              color: AppColors.dimWhiteColor.withOpacity(0.7),
              fontSize: 12,
            ),
          ),
          Text(
            watchName!,
            style: const TextStyle(color: AppColors.whiteColor, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
