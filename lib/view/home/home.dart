import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/constants/app_urls.dart';
import 'package:time4deal/controller/home_controller/home_controller.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/app_padding.dart';
import 'package:time4deal/helpers/app_text_styles.dart';
import 'package:time4deal/helpers/sized_boxes.dart';
import 'package:time4deal/view/home/widget/home_carousal.dart';
import 'package:time4deal/view/home/widget/trending_products.dart';
import 'package:time4deal/widgets/custome_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context, listen: false);

    return Scaffold(
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBoxes.heightBox10,
              Consumer<HomeController>(
                builder: (context, value, child) {
                  return value.isLoading
                      ? const SizedBox()
                      : value.carousalItems.isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('FEATURED',
                                    style:
                                        TextStyle(color: AppColors.redColor)),
                                Text(
                                  'FPRODUCTS',
                                  style: AppTextStyles.head1,
                                ),
                                SizedBoxes.heightBox10,
                                HomeCarousals()
                              ],
                            )
                          : const SizedBox();
                },
              ),
              SizedBoxes.heightBox10,
              SizedBox(
                height: 105,
                child: Consumer<HomeController>(
                  builder: (context, value, child) => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      if (value.isCategoryLoding) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        value.categoriesList[index].name.split(' ');
                        return Padding(
                          padding: AppPadding.horizPadding5,
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: AppColors.whiteColor,
                                radius: 30,
                                child: CircleAvatar(
                                  backgroundColor: AppColors.whiteColor,
                                  backgroundImage: NetworkImage(
                                      AppUrls.categoryMainUrl +
                                          value.categoriesList[index].image),
                                  radius: 27,
                                ),
                              ),
                              SizedBoxes.heightBox5,
                              Text(
                                value.categoriesList[index].name
                                    .replaceAll(' ', '\n'),
                                textAlign: TextAlign.center,
                                style: TextStyle(),
                              )
                            ],
                          ),
                        );
                      }
                    },
                    itemCount: value.categoriesList.length,
                  ),
                ),
              ),
              SizedBoxes.heightBox10,
              const Text(
                'TRENDING',
                style: TextStyle(color: AppColors.redColor),
              ),
              const Text(
                'FPRODUCTS',
                style: AppTextStyles.head1,
              ),
              SizedBoxes.heightBox10,
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: (const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.75,
                )),
                itemBuilder: (context, index) => TrendingProduct(
                    model: homeController.trendingProductItems[index],
                    index: index,
                    image: homeController.trendingProductItems[index].image,
                    company: homeController.trendingProductItems[index].company,
                    watchName: homeController.trendingProductItems[index].name,
                    isFavourite:
                        homeController.trendingProductItems[index].isFavourite),
                // homeController.trendingProductItems[index],
                itemCount: homeController.trendingProductItems.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
