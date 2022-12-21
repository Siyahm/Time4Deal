import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/cart_controller/cart_controller.dart';
import 'package:time4deal/controller/product_details_controller/product_details_controller.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/app_text_styles.dart';
import 'package:time4deal/widgets/add_buy_elevated_buttons.dart';

class RemoveAndButButtons extends StatelessWidget {
  const RemoveAndButButtons({
    Key? key,
    required this.itemId,
  }) : super(key: key);
  final String itemId;

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context, listen: false);
    final productDetailsController =
        Provider.of<ProductDetailsContoller>(context, listen: false);
    return Row(
      children: [
        AddAndBuyElevatedButton(
          color: AppColors.greyColor,
          label: 'Remove',
          ontap: () async {
            await cartController.remomeCartItem(itemId);

            await cartController.getCartItems();
          },
          labelStyle: AppTextStyles.normalTextBlack,
        ),
        AddAndBuyElevatedButton(
          color: AppColors.dimWhiteColor,
          label: 'Buy Now',
          ontap: () {
            productDetailsController.goToStepperScreen(context);
          },
          labelStyle: AppTextStyles.normalTextBlack,
        ),
      ],
    );
  }
}
