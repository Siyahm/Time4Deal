import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/product_details_controller/product_details_controller.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/app_text_styles.dart';
import 'package:time4deal/helpers/sized_boxes.dart';

class Features extends StatelessWidget {
  const Features({
    Key? key,
    required this.feature1,
    required this.text1,
    required this.feature2,
    required this.text2,
  }) : super(key: key);
  final String feature1;
  final String feature2;

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailsContoller>(
      builder: (context, value, child) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                feature1,
                style: const TextStyle(color: AppColors.greyColor),
              ),
              SizedBoxes.heightBox5,
              Text(
                text1,
                style: AppTextStyles.normalText,
              ),
              SizedBoxes.heightBox10,
              Text(
                feature2,
                style: const TextStyle(color: AppColors.greyColor),
              ),
              SizedBoxes.heightBox5,
              Text(
                text2,
                style: AppTextStyles.normalText,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
