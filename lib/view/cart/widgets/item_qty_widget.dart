import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/cart_controller/cart_controller.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/app_text_styles.dart';

class ItemQtyWidget extends StatelessWidget {
  const ItemQtyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<CartController>(
      builder: (context, value, child) => Row(
        children: [
          Container(
            height: size.height * 0.049,
            decoration: const BoxDecoration(
              color: AppColors.dimWhiteColor,
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
                    // value.onPressedMinusButton();
                  },
                  icon: const Icon(
                    Icons.remove,
                    color: AppColors.blackColor,
                  ),
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
                    // value.onPressedPlusButton();
                  },
                  icon: const Icon(
                    Icons.add,
                    color: AppColors.blackColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
