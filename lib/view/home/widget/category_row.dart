import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:time4deal/constants/api_endpoints.dart';
import 'package:time4deal/constants/app_urls.dart';
import 'package:time4deal/controller/products_view_screen_controller/product_view_screen_controller.dart';
import 'package:time4deal/controller/home_controller/home_controller.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/app_padding.dart';
import 'package:time4deal/helpers/sized_boxes.dart';
import 'package:time4deal/routes/rout_names.dart';
import 'package:time4deal/view/category_products_view_screen/category_product_view_screen_args.dart';

class CategoryRow extends StatelessWidget {
  const CategoryRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productViewScreenController =
        Provider.of<ProductViewScreenController>(
      context,
    );
    return SizedBox(
      height: 105,
      child: Consumer<HomeController>(
        builder: (context, value, child) => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: AppPadding.horizPadding5,
              child: GestureDetector(
                onTap: () {
                  ProductViewScreenArgs args =
                      ProductViewScreenArgs(index: index);
                  Navigator.of(context).pushNamed(RouteNames.productsViewScreen,
                      arguments: args);
                  productViewScreenController
                      .getCategoryProducts(value.categoriesList[index].id);
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.whiteColor,
                      radius: 30,
                      child: CircleAvatar(
                        backgroundColor: AppColors.whiteColor,
                        backgroundImage: NetworkImage(
                            '${AppUrls.networkImageMainUrl}${ApiEndPoints.getCategory}/${value.categoriesList[index].image}'),
                        radius: 27,
                      ),
                    ),
                    SizedBoxes.heightBox5,
                    Text(
                      value.categoriesList[index].name.replaceAll(' ', '\n'),
                      textAlign: TextAlign.center,
                      style: const TextStyle(),
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: value.categoriesList.length,
        ),
      ),
    );
  }
}
