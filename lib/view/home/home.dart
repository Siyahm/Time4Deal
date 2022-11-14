import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/home_controller/home_controller.dart';
import 'package:time4deal/helpers/app_text_styles.dart';
import 'package:time4deal/helpers/sized_boxes.dart';
import 'package:time4deal/widgets/custome_app_bar.dart';
import 'package:time4deal/view/home/widget/trending_products.dart';

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
              const Text('FEATURED'),
              const Text(
                'FPRODUCTS',
                style: AppTextStyles.head1,
              ),
              SizedBoxes.heightBox10,
              CarouselSlider(
                items: homeController.featuredProductItems,
                options: CarouselOptions(
                  height: 210,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  // aspectRatio: 12 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 1,
                ),
              ),
              SizedBoxes.heightBox10,
              const Text('TRENDING'),
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
