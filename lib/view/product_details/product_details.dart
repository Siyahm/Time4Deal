import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/product_details_controller/product_details_controller.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/app_padding.dart';
import 'package:time4deal/helpers/app_text_styles.dart';
import 'package:time4deal/helpers/sized_boxes.dart';
import 'package:time4deal/models/product_model/product_model.dart';
import 'package:time4deal/utils/common_functions.dart';
import 'package:time4deal/view/product_details/widgets/carousels.dart';
import 'package:time4deal/view/product_details/widgets/elevatted_buttons.dart';
import 'package:time4deal/view/product_details/widgets/item_name.dart';
import 'package:time4deal/view/product_details/widgets/product_features.dart';
import 'package:time4deal/view/product_details/widgets/quantity_and_prize.dart';
import 'package:time4deal/widgets/custom_app_bar_leading.dart';
import 'package:time4deal/widgets/custom_app_bar_trailing.dart';
import 'package:time4deal/widgets/custome_app_bar.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final productDetailsController =
    //     Provider.of<ProductDetailsContoller>(context, listen: false);
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
                        children: const [
                          Carousals(),
                          ItemName(
                              // index: index,
                              ),
                          // model: productDetailsController.product),
                          SizedBoxes.heightBox10,
                          Text(
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
                  Container(
                    height: size.height * 0.07,
                    width: size.width * 0.15,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('lib/assets/delivery icon.png'))),
                  ),
                  const Text('Free Delivery'),
                  const Spacer(),
                  Consumer<ProductDetailsContoller>(
                    builder: (context, value, child) => value.isLoading
                        ? const SizedBox()
                        : SizedBox(
                            child: RatingBar.builder(
                                ignoreGestures: true,
                                allowHalfRating: true,
                                itemSize: 20,
                                initialRating:
                                    double.parse(value.product!.rating),
                                direction: Axis.horizontal,
                                glowRadius: 1,
                                itemCount: 5,
                                itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.green,
                                    ),
                                onRatingUpdate: (rating) {}),
                          ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  QuantityAndPrice(),
                  ElevattedButtons(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
