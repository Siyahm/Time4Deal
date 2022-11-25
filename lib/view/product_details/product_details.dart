import 'package:flutter/material.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/app_padding.dart';
import 'package:time4deal/helpers/app_text_styles.dart';
import 'package:time4deal/helpers/sized_boxes.dart';
import 'package:time4deal/models/product_model/product_model.dart';
import 'package:time4deal/utils/common_functions.dart';
import 'package:time4deal/view/product_details/widgets/carousels.dart';
import 'package:time4deal/view/product_details/widgets/elevatted_buttons.dart';
import 'package:time4deal/view/product_details/widgets/features.dart';
import 'package:time4deal/view/product_details/widgets/item_name.dart';
import 'package:time4deal/view/product_details/widgets/quantity_and_prize.dart';
import 'package:time4deal/widgets/custome_app_bar.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
    required this.index,
    required this.model,
  });
  final int index;
  final ProductModel? model;

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.transperantColor,
      appBar: CustomeAppBar(
        leadingWidget: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            CommonFunctions.popFunction(context);
          },
        ),
      ),
      body: Padding(
        padding: AppPadding.horizPadding8,
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
                        const Carousals(),
                        ItemName(index: index, model: model),
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
            Row(
              children: const [
                Features(
                  feature1: 'Type:',
                  text1: 'Sports',
                  feature2: 'Band width:',
                  text2: '60 m',
                ),
                Spacer(),
                Features(
                  feature1: 'Display Type:',
                  text1: 'Digital',
                  feature2: 'Band color:',
                  text2: 'Black',
                ),
                Spacer(),
                Features(
                  feature1: 'Display color:',
                  text1: 'Black',
                  feature2: 'Warrenty',
                  text2: '1 year',
                ),
              ],
            ),
            SizedBoxes.heightBox30,
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
    );
  }
}
