import 'package:flutter/cupertino.dart';
import 'package:time4deal/helpers/sized_boxes.dart';
import 'package:time4deal/view/home/widget/category_shimmer.dart';
import 'package:time4deal/view/home/widget/featured_product_carousal_shimmer.dart';
import 'package:time4deal/view/home/widget/products_card_shimmer.dart';

class HomeScreenShimmers extends StatelessWidget {
  const HomeScreenShimmers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBoxes.heightBox10,
        FeaturedProductCarousalShimmer(),
        SizedBoxes.heightBox10,
        CategoryShimmer(),
        SizedBoxes.heightBox10,
        Expanded(child: ProductsCardShimmer()),
        SizedBoxes.heightBox10,
      ],
    );
  }
}
