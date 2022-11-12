import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/home_controller/home_controller.dart';
import 'package:time4deal/helpers/app_text_styles.dart';
import 'package:time4deal/helpers/sized_boxes.dart';
import 'package:time4deal/view/home/widget/custome_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context, listen: false);
    return Scaffold(
      appBar: const CustomeAppBar(),
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
                  childAspectRatio: 0.8,
                )),
                itemBuilder: (context, index) =>
                    homeController.trendingProductItems[index],
                itemCount: homeController.trendingProductItems.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
