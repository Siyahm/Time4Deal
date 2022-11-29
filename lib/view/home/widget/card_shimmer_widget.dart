import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/sized_boxes.dart';

class CardShimmerWidget extends StatelessWidget {
  const CardShimmerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      baseColor: AppColors.greyColor[300]!,
      highlightColor: AppColors.greyColor[100]!,
      child: Column(
        children: [
          Card(
            color: AppColors.whiteColor,
            child: Container(
              height: size.height * 0.24,
              // width: size.width * 0.38,
              margin: const EdgeInsets.symmetric(vertical: 5),
            ),
          ),
          SizedBoxes.heightBox5,
          Container(
            height: 40,
            width: size.width * 0.45,
            decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(15))),
          )
        ],
      ),
    );
  }
}
