import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/product_details_controller/product_details_controller.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/app_text_styles.dart';
import 'package:time4deal/helpers/sized_boxes.dart';

class QuantityAndPrice extends StatelessWidget {
  const QuantityAndPrice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProductDetailsContoller>(context, listen: false)
          .findTotalPrice();
    });
    return Consumer<ProductDetailsContoller>(
      builder: (context, value, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('Quantity: '),
              Container(
                height: size.height * 0.049,
                decoration: const BoxDecoration(
                  color: AppColors.themeColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      splashRadius: 15,
                      onPressed: () {
                        value.onPressedMinusButton();
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: size.height * 0.045,
                      width: size.width * 0.08,
                      color: AppColors.bgColor,
                      child: Text(
                        value.quantity.toString(),
                        style: AppTextStyles.normalTextBold,
                      ),
                    ),
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      splashRadius: 15,
                      onPressed: () {
                        value.onPressedPlusButton();
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBoxes.heightBox20,
          Row(
            children: [
              Text(
                "${value.offerPercentage}% off",
                style: const TextStyle(
                    fontSize: 24,
                    color: AppColors.greenColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBoxes.widthBox10,
              Text(
                value.totalPrice.toString(),
                style: const TextStyle(
                    decorationColor: AppColors.redColor,
                    decorationThickness: 2,
                    decoration: TextDecoration.lineThrough,
                    fontSize: 24,
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBoxes.widthBox10,
              Text(
                value.offerPrice.toInt().toString(),
                style: const TextStyle(
                    fontSize: 24,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
