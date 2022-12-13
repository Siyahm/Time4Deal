import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/view/home/widget/titles_shimmer_container.dart';

class FeaturedProductCarousalShimmer extends StatelessWidget {
  const FeaturedProductCarousalShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      baseColor: AppColors.greyColor[300]!,
      highlightColor: AppColors.greyColor[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitlesShimmerContainer(),
          const SizedBox(
            height: 4,
          ),
          Container(
            width: double.infinity,
            height: size.height * 0.3,
            color: AppColors.whiteColor,
          ),
        ],
      ),
    );
  }
}
