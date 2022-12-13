import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/sized_boxes.dart';
import 'package:time4deal/view/home/widget/card_shimmer_widget.dart';
import 'package:time4deal/view/home/widget/titles_shimmer_container.dart';

class ProductsCardShimmer extends StatelessWidget {
  const ProductsCardShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.greyColor[300]!,
      highlightColor: AppColors.greyColor[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitlesShimmerContainer(),
          SizedBoxes.heightBox5,
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: (const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                // mainAxisSpacing: 8,
                // childAspectRatio: 0.63,
              )),
              itemBuilder: (context, index) => const CardShimmerWidget(),

              // homeController.trendingProductItems[index],
              itemCount: 2,
            ),
          ),
        ],
      ),
    );
  }
}
