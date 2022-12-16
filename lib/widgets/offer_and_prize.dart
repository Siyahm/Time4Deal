import 'package:flutter/material.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/sized_boxes.dart';

class OfferAndPrice extends StatelessWidget {
  const OfferAndPrice({
    Key? key,
    required this.originalPrice,
    required this.offerPrice,
    required this.offerPercentage,
  }) : super(key: key);

  final String? originalPrice;
  final String? offerPrice;
  final String? offerPercentage;

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   Provider.of<ProductDetailsContoller>(context, listen: false);
    //   // .findTotalPrice();
    // });
    return Row(
      children: [
        Text(
          originalPrice!,
          // '₹${value.totalPrice.toString()}',
          style: const TextStyle(
              decorationColor: AppColors.redColor,
              decorationThickness: 2,
              decoration: TextDecoration.lineThrough,
              fontSize: 22,
              color: AppColors.greyColor,
              fontWeight: FontWeight.bold),
        ),
        SizedBoxes.widthBox8,
        Text(
          offerPrice!,
          // '₹${value.offerPrice.toInt().toString()}',
          style: const TextStyle(
              fontSize: 24,
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold),
        ),
        SizedBoxes.widthBox8,
        Text(
          offerPercentage!,
          // "${value.offerPercentage}% off",
          style: const TextStyle(
              fontSize: 20,
              color: AppColors.greenColor,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
