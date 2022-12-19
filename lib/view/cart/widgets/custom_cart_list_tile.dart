import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/cart_controller/cart_controller.dart';
import 'package:time4deal/controller/product_details_controller/product_details_controller.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/app_padding.dart';
import 'package:time4deal/helpers/app_text_styles.dart';
import 'package:time4deal/helpers/sized_boxes.dart';
import 'package:time4deal/view/cart/widgets/item_qty_widget.dart';
import 'package:time4deal/widgets/add_buy_elevated_buttons.dart';
import 'package:time4deal/widgets/offer_and_prize.dart';

class CustomCartListTile extends StatelessWidget {
  const CustomCartListTile({
    Key? key,
    required this.image,
    required this.name,
    required this.brand,
    required this.index,
  }) : super(key: key);

  final String? image;
  final String? name;
  final String? brand;
  final int? index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cartController = Provider.of<CartController>(context, listen: false);
    return Column(
      children: [
        Container(
          color: AppColors.themeColor,
          width: double.infinity,
          child: Padding(
            padding: AppPadding.allPadding10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.dimWhiteColor,
                        image: DecorationImage(
                          image: NetworkImage(image!),
                        ),
                      ),
                      height: 130,
                      width: 120,
                    ),
                    SizedBoxes.widthBox8,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name!,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            softWrap: true,
                            style: AppTextStyles.head1,
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            brand!,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          FittedBox(
                            child: Consumer<CartController>(
                              builder: (context, value, child) => OfferAndPrice(
                                originalPrice:
                                    value.cartList[index!].price.toString(),
                                offerPrice: value.cartList[index!].discountPrice
                                    .toString(),
                                offerPercentage:
                                    '${value.cartList[index!].offer.toString()}%',
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Quantity: '),
                    SizedBoxes.heightBox5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const ItemQtyWidget(),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Row(
                          children: const [
                            Text('Delivery by: '),
                            Text('Dec 19'),
                          ],
                        ),
                        Container(
                          height: size.height * 0.04,
                          width: size.width * 0.003,
                          color: AppColors.whiteColor,
                        ),
                        Row(
                          children: const [
                            Text('Delivery: '),
                            Text('Free'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox()
              ],
            ),
          ),
        ),
        const RemoveAndButButtons(itemId: 'cartController.cartList[index].id'),
      ],
    );
  }
}

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
