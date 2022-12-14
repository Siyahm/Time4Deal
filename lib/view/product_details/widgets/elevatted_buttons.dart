import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/product_details_controller/product_details_controller.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/app_text_styles.dart';

class ElevattedButtons extends StatelessWidget {
  const ElevattedButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productDetailsController =
        Provider.of<ProductDetailsContoller>(context);
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.redColor,
              minimumSize: Size(size.width * 0.3, size.height * 0.049),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          onPressed: () {
            productDetailsController.goToStepperScreen(context);
          },
          child: const Text(
            'Buy Now',
            style: AppTextStyles.normalText,
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.whiteColor,
              minimumSize: Size(size.width * 0.3, size.height * 0.045),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          onPressed: () {},
          child: const Text(
            'Add to cart',
            style: AppTextStyles.normalTextBlack,
          ),
        ),
      ],
    );
  }
}
