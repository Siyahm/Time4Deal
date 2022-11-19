import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/product_details_controller/product_details_controller.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/app_padding.dart';
import 'package:time4deal/helpers/app_text_styles.dart';
import 'package:time4deal/helpers/sized_boxes.dart';
import 'package:time4deal/utils/common_functions.dart';
import 'package:time4deal/view/product_details/widgets/brand_colors.dart';
import 'package:time4deal/widgets/custome_app_bar.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final productDetailsController =
        Provider.of<ProductDetailsContoller>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.transperantColor,
      appBar: CustomeAppBar(
        leadingWidget: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            CommonFunctions.popFunction(context);
          },
        ),
      ),
      body: Padding(
        padding: AppPadding.horizPadding8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: AppColors.whiteColor,
              child: Padding(
                padding: AppPadding.horizPadding15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.4,
                      child: CarouselSlider.builder(
                        unlimitedMode: true,
                        itemCount:
                            productDetailsController.productImages.length,
                        slideBuilder: (int index) {
                          log('re buliding');
                          return Container(
                            height: size.height * 0.4,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: AssetImage(
                                  productDetailsController.productImages[index],
                                ),
                              ),
                            ),
                          );
                        },
                        slideIndicator: CircularWaveSlideIndicator(
                          currentIndicatorColor: AppColors.redColor,
                          indicatorBackgroundColor: AppColors.greyColor,
                          padding: AppPadding.bottomOnly8,
                        ),
                      ),
                    ),
                    const Text(
                      'Space Black Stinless\nSteel Case',
                      style: AppTextStyles.head1blsck,
                    ),
                    SizedBoxes.heightBox10,
                    const Text(
                      '₹ 499',
                      style: AppTextStyles.normalTextBlack,
                    ),
                    SizedBoxes.heightBox10,
                  ],
                ),
              ),
            ),
            SizedBoxes.heightBox20,
            const Text('Brand Colors'),
            SizedBoxes.heightBox10,
            const BrandColors(),
          ],
        ),
      ),
    );
  }
}
