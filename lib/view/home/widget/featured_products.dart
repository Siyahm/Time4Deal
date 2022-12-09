import 'package:flutter/cupertino.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/app_padding.dart';
import 'package:time4deal/helpers/app_text_styles.dart';

class FeaturedProduct extends StatelessWidget {
  const FeaturedProduct({
    Key? key,
    required this.image,
    required this.offer,
  }) : super(key: key);

  final String image;
  final String offer;

  @override
  Widget build(BuildContext context) {
    // log(image);
    return Container(
      alignment: const Alignment(0.9, 0.0),
      margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
      decoration: BoxDecoration(
        // border: Border.all(width: 1, color: AppColors.whiteColor),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(image),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            children: [
              Text(
                offer,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 3
                      ..color = AppColors.whiteColor),
              ),
              Text(offer,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.subTitleRed),
            ],
          ),
          Container(
            decoration: const BoxDecoration(
              color: AppColors.redColor,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: const Padding(
              padding: AppPadding.allPadding8,
              child: Text('Shop Now'),
            ),
          )
        ],
      ),
    );
  }
}
