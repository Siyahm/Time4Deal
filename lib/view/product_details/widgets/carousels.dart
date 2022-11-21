import 'package:flutter/cupertino.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
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
    final productDetailsController =
        Provider.of<ProductDetailsContoller>(context);
    return SizedBox(
      height: size.height * 0.4,
      child: CarouselSlider.builder(
        unlimitedMode: true,
        itemCount: productDetailsController.productImages.length,
        slideBuilder: (int index) {
          return Container(
            height: size.height * 0.4,
            decoration: BoxDecoration(
              color: AppColors.themeColor,
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
    );
  }
}
