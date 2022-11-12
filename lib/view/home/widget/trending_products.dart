import 'package:flutter/material.dart';
import 'package:time4deal/helpers/app_colors.dart';

class TrendingProduct extends StatelessWidget {
  const TrendingProduct({
    Key? key,
    required this.image,
    required this.company,
    required this.watchName,
  }) : super(key: key);
  final String image;
  final String company;
  final String watchName;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Card(
              color: AppColors.themeColor,
              child: Container(
                height: size.height * 0.24,
                // width: size.width * 0.38,
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage(image),
                  ),
                ),
                // child: Image(
                //   image: AssetImage(image),
                // ),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_outline,
                  color: AppColors.bgColor,
                ))
          ],
        ),
        Text(
          company,
          style: TextStyle(
            color: AppColors.dimWhiteColor.withOpacity(0.7),
            fontSize: 14,
          ),
        ),
        Text(
          watchName,
          style: const TextStyle(color: AppColors.themeColor, fontSize: 16),
        ),
      ],
    );
  }
}
