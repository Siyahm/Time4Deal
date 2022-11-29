import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/constants/api_endpoints.dart';
import 'package:time4deal/constants/app_urls.dart';
import 'package:time4deal/controller/home_controller/home_controller.dart';
import 'package:time4deal/controller/products_view_screen_controller/product_view_screen_controller.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/app_padding.dart';
import 'package:time4deal/helpers/sized_boxes.dart';
import 'package:time4deal/utils/common_functions.dart';
import 'package:time4deal/widgets/custom_app_bar_trailing.dart';
import 'package:time4deal/widgets/custome_app_bar.dart';
import 'package:time4deal/widgets/products_view.dart';

class CategoryProducsViewtScreen extends StatelessWidget {
  const CategoryProducsViewtScreen({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final homeController = Provider.of<HomeController>(context, listen: false);
    final producsViewtScreenController =
        Provider.of<ProductViewScreenController>(context, listen: false);
    return Scaffold(
      backgroundColor: AppColors.transperantColor,
      appBar: CustomeAppBar(
        leadingWidget: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            CommonFunctions.popFunction(context);
          },
        ),
        trailing: const CustomAppbarTrailing(),
        title: homeController.categoriesList[index].name,
      ),
      body: Padding(
        padding: AppPadding.horizPadding8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   homeController.categoriesList[index].name,
            //   style: AppTextStyles.subTitle,
            // ),
            SizedBoxes.heightBox10,
            Consumer<ProductViewScreenController>(
              builder: (context, value, child) => value.isLoading
                  ? const CircularProgressIndicator()
                  : value.categoryProducts.isEmpty
                      ? Center(
                          heightFactor: size.height * 0.02,
                          child: const Text(
                            'No Items Available',
                            style: TextStyle(
                                color: AppColors.greyColor, fontSize: 16),
                          ),
                        )
                      : GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              (const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 0.63,
                          )),
                          itemBuilder: (context, index) => ProductsView(
                              productId: value.categoryProducts[index].id,
                              index: index,
                              image:
                                  '${AppUrls.networkImageMainUrl}${ApiEndPoints.getProducts}/${value.categoryProducts[index].image[0]}',
                              company: 'No brand',
                              watchName: value.categoryProducts[index].name,
                              rating: value.categoryProducts[index].rating,
                              isFavourite: false),
                          // homeController.trendingProductItems[index],
                          itemCount: producsViewtScreenController
                              .categoryProducts.length,
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
