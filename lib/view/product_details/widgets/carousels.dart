import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:time4deal/constants/api_endpoints.dart';
import 'package:time4deal/constants/app_urls.dart';
import 'package:time4deal/controller/product_details_controller/product_details_controller.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/app_padding.dart';

class Carousals extends StatelessWidget {
  const Carousals({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final productDetailsController =
    //     Provider.of<ProductDetailsContoller>(context);
    return Consumer<ProductDetailsContoller>(
      builder: (context, value, child) => value.isLoading
          ? Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.white,
              ),
            )
          : SizedBox(
              height: size.height * 0.4,
              child: CarouselSlider.builder(
                unlimitedMode: true,
                itemCount: value.product!.image.length,
                slideBuilder: (int index) {
                  return Container(
                    height: size.height * 0.4,
                    decoration: BoxDecoration(
                      color: AppColors.themeColor,
                      image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: NetworkImage(
                          '${AppUrls.networkImageMainUrl}${ApiEndPoints.getProducts}/${value.product!.image[index]}',
                        ),
                      ),
                    ),
                  );
                },
                slideIndicator: CircularWaveSlideIndicator(
                  currentIndicatorColor: AppColors.redColor,
                  indicatorBackgroundColor:
                      AppColors.greyColor.withOpacity(0.5),
                  padding: AppPadding.bottomOnly8,
                ),
              ),
            ),
    );
  }
}
