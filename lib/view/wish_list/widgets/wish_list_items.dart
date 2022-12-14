import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/product_details_controller/product_details_controller.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/app_padding.dart';
import 'package:time4deal/helpers/sized_boxes.dart';

class WishListItemTile extends StatelessWidget {
  const WishListItemTile({
    super.key,
    required this.image,
    required this.name,
    required this.company,
    required this.rate,
    // required this.color,
    required this.closeFunction,
    required this.index,
  });
  final String? image;
  final String? name;
  final String? company;
  final int? rate;
  // final Color? color;
  final VoidCallback closeFunction;
  final int index;

  @override
  Widget build(BuildContext context) {
    final productDetailsContoller =
        Provider.of<ProductDetailsContoller>(context, listen: false);
    return ListTile(
      title: Row(
        children: [
          Container(
            // padding: EdgeInsets.all(8),
            width: 70,
            height: 100,
            color: AppColors.greyColor,
            child: Padding(
              padding: AppPadding.allPadding2,
              child: Image(image: NetworkImage(image!)),
            ),
          ),
          SizedBoxes.widthBox10,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 18, color: AppColors.whiteColor),
                ),
                Text('₹ ${rate!}'),
                Padding(
                  padding: AppPadding.verticalPadding8,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              border: Border.all(width: 2),
                              // color: AppColors.themeColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.all(6),
                          child: const Text(
                            'Add to Cart',
                            style: TextStyle(color: AppColors.blackColor),
                          ),
                        ),
                      ),
                      SizedBoxes.widthBox8,
                      GestureDetector(
                        onTap: () {
                          productDetailsContoller.goToStepperScreen(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.redColor,
                              border: Border.all(width: 2),
                              // color: AppColors.themeColor,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.all(6),
                          child: const Text(
                            'Buy now',
                            style: TextStyle(color: AppColors.whiteColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      trailing: IconButton(
          splashRadius: 15,
          onPressed: () {
            closeFunction();
          },
          icon: const Icon(Icons.close)),
    );
  }
}
