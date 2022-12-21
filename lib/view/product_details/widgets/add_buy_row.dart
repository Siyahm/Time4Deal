import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/cart_controller/cart_controller.dart';
import 'package:time4deal/controller/product_details_controller/product_details_controller.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/app_text_styles.dart';
import 'package:time4deal/models/cart_model/cart_post_model.dart';
import 'package:time4deal/utils/custom_toast.dart';
import 'package:time4deal/widgets/add_buy_elevated_buttons.dart';

class AddBuyRow extends StatelessWidget {
  const AddBuyRow({
    Key? key,
    required this.cartPostModel,
  }) : super(key: key);
  final CartPostModel cartPostModel;

  @override
  Widget build(BuildContext context) {
    final productDetailsController =
        Provider.of<ProductDetailsContoller>(context);
    final cartController = Provider.of<CartController>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Consumer<CartController>(
          builder: (context, value, child) => AddAndBuyElevatedButton(
            color: AppColors.whiteColor,
            label: value.cartItemsIds.contains(cartPostModel.productId)
                ? 'Go to Cart'
                : 'Add to cart',
            ontap: () async {
              value.cartItemsIds.contains(cartPostModel.productId)
                  ? value.goToCart(context)
                  : await cartController.addToCart(cartPostModel);
              await cartController.getCartItems();
            },
            labelStyle: AppTextStyles.normalTextBlack,
          ),
        ),
        AddAndBuyElevatedButton(
          color: AppColors.redColor,
          label: 'Buy Now',
          ontap: () {
            productDetailsController.goToStepperScreen(context);
          },
          labelStyle: AppTextStyles.normalText,
        ),
      ],
    );
  }
}
