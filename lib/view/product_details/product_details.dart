import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/product_details_controller/product_details_controller.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/app_padding.dart';
import 'package:time4deal/helpers/app_text_styles.dart';
import 'package:time4deal/helpers/sized_boxes.dart';
import 'package:time4deal/models/cart_model/cart_post_model.dart';
import 'package:time4deal/view/product_details/widgets/carousels.dart';
import 'package:time4deal/view/product_details/widgets/add_buy_row.dart';
import 'package:time4deal/view/product_details/widgets/item_name.dart';
import 'package:time4deal/view/product_details/widgets/product_features.dart';
import 'package:time4deal/widgets/offer_and_prize.dart';
import 'package:time4deal/widgets/custom_app_bar_leading.dart';
import 'package:time4deal/widgets/custom_app_bar_trailing.dart';
import 'package:time4deal/widgets/custome_app_bar.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productDetailsController =
        Provider.of<ProductDetailsContoller>(context, listen: false);
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   // await productDetailsController.getAProduct(productId!);
    // });
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.transperantColor,
      appBar: const CustomeAppBar(
        leadingWidget: CustomAppBarLeadingWidget(),
        trailing: CustomAppbarTrailing(),
      ),
      body: Padding(
        padding: AppPadding.horizPadding8,
        child: SizedBox(
          height: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: AppColors.themeColor,
                            child: Padding(
                              padding: AppPadding.horizPadding15,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: size.height * 0.008,
                                  ),
                                  const Carousals(),
                                  Consumer<ProductDetailsContoller>(
                                    builder: (context, value, child) =>
                                        ItemName(productId: value.product!.id),
                                  ),
                                  // model: productDetailsController.product),
                                  SizedBoxes.heightBox10,
                                  const Text(
                                    'Brand',
                                    style: AppTextStyles.normalText,
                                  ),
                                  SizedBoxes.heightBox10,
                                ],
                              ),
                            ),
                          ),
                          SizedBoxes.heightBox20,
                        ],
                      ),
                      const ProductFeatures(),
                      SizedBoxes.heightBox10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Special Prices',
                                style: TextStyle(color: AppColors.greenColor),
                              ),
                              Consumer<ProductDetailsContoller>(
                                builder: (context, value, child) =>
                                    OfferAndPrice(
                                  originalPrice: '₹${value.product!.price}',
                                  offerPrice:
                                      '₹${value.product!.discountPrice}',
                                  offerPercentage:
                                      '${value.product!.offer}% off',
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              Consumer<ProductDetailsContoller>(
                                builder: (context, value, child) =>
                                    value.isLoading
                                        ? const SizedBox()
                                        : SizedBox(
                                            child: RatingBar.builder(
                                                ignoreGestures: true,
                                                allowHalfRating: true,
                                                itemSize: 20,
                                                initialRating: double.parse(
                                                    value.product!.rating),
                                                direction: Axis.horizontal,
                                                glowRadius: 1,
                                                itemCount: 5,
                                                itemBuilder: (context, _) =>
                                                    const Icon(
                                                      Icons.star,
                                                      color: Colors.green,
                                                    ),
                                                onRatingUpdate: (rating) {}),
                                          ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: size.height * 0.07,
                                    width: size.width * 0.15,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'lib/assets/delivery icon.png'),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: const [
                                      Text(
                                        'Delivery:',
                                        softWrap: true,
                                        maxLines: 2,
                                      ),
                                      Text(
                                        'Free',
                                        style: TextStyle(
                                            color: AppColors.greenColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              AddBuyRow(
                cartPostModel: CartPostModel(
                  productId: productDetailsController.product!.id,
                  qty: "1",
                  size: productDetailsController.product!.size[0],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
