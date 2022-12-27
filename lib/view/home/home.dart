import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/constants/api_endpoints.dart';
import 'package:time4deal/constants/app_urls.dart';
import 'package:time4deal/controller/home_controller/home_controller.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/app_text_styles.dart';
import 'package:time4deal/helpers/sized_boxes.dart';
import 'package:time4deal/view/home/widget/category_row.dart';
import 'package:time4deal/view/home/widget/home_carousal.dart';
import 'package:time4deal/view/home/widget/home_shimmers.dart';
import 'package:time4deal/widgets/custom_app_bar_trailing.dart';
import 'package:time4deal/widgets/custome_app_bar.dart';
import 'package:time4deal/widgets/products_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    // final homeController = Provider.of<HomeController>(context, listen: false);

    return Consumer<HomeController>(
      builder: (context, value, child) => Scaffold(
        appBar: CustomeAppBar(
          leadingWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBoxes.heightBox10,
              Text(
                'Hello',
              ),
              Text(
                'Name',
                style: AppTextStyles.normalTextYellow,
              ),
            ],
          ),
          trailing: const CustomAppbarTrailing(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: value.isLoading
              ? const HomeScreenShimmers()
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBoxes.heightBox10,
                      value.carousalItems.isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'FEATURED',
                                  style: TextStyle(color: AppColors.redColor),
                                ),
                                Text(
                                  'FPRODUCTS',
                                  style: AppTextStyles.head1,
                                ),
                                SizedBoxes.heightBox10,
                                HomeCarousals()
                              ],
                            )
                          : const SizedBox(),
                      SizedBoxes.heightBox10,
                      const CategoryRow(),
                      SizedBoxes.heightBox10,
                      value.trendingProductItems.isEmpty
                          ? const SizedBox()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'TRENDING',
                                  style: TextStyle(color: AppColors.redColor),
                                ),
                                Text(
                                  'FPRODUCTS',
                                  style: AppTextStyles.head1,
                                ),
                              ],
                            ),
                      SizedBoxes.heightBox10,
                      GridView.builder(
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
                          productId: value.trendingProductItems[index].id,
                          model: value.trendingProductItems[index],
                          // index: index,
                          image:
                              '${AppUrls.networkImageMainUrl}${ApiEndPoints.getProducts}/${value.trendingProductItems[index].image[0]}',
                          company: "Brand Name",
                          watchName: value.trendingProductItems[index].name,
                          rating: value.trendingProductItems[index].rating,
                          isFavourite: false,
                        ),

                        // homeController.trendingProductItems[index],
                        itemCount: value.trendingProductItems.length,
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
