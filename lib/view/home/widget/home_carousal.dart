import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/constants/app_urls.dart';
import 'package:time4deal/controller/home_controller/home_controller.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/view/home/widget/featured_products.dart';

class HomeCarousals extends StatelessWidget {
  const HomeCarousals({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.3,
      child: Consumer<HomeController>(
        builder: (BuildContext context, value, Widget? child) {
          return value.carousalItems.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : CarouselSlider.builder(
                  enableAutoSlider: true,
                  unlimitedMode: true,
                  autoSliderTransitionTime: const Duration(milliseconds: 900),
                  itemCount: value.carousalItems.length,
                  slideBuilder: (int index) {
                    return FeaturedProduct(
                      image: AppUrls.carousalMainUrl +
                          value.carousalItems[index].image!,
                      offer: "${value.carousalItems[index].offer!}%\noff",
                    );
                  },
                  slideIndicator: CircularSlideIndicator(
                    currentIndicatorColor: AppColors.redColor,
                    indicatorBackgroundColor: AppColors.whiteColor,
                    padding: const EdgeInsets.only(bottom: 32),
                  ),
                );
        },
      ),
    );
  }
}
