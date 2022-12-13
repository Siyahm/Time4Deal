import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/app_padding.dart';
import 'package:time4deal/helpers/sized_boxes.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Padding(
              padding: AppPadding.horizPadding8,
              child: Column(
                children: [
                  const CircleAvatar(
                    backgroundColor: AppColors.whiteColor,
                    radius: 30,
                  ),
                  SizedBoxes.heightBox5,
                  Container(
                    color: AppColors.whiteColor,
                    width: 60,
                    height: 15,
                  ),
                ],
              ),
            ),
          );
        }),
        itemCount: 5,
      ),
    );
  }
}
