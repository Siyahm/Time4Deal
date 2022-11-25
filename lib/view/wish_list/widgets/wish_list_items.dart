import 'package:flutter/material.dart';
import 'package:time4deal/helpers/app_colors.dart';
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
  final List<String>? image;
  final String? name;
  final String? company;
  final String? rate;
  // final Color? color;
  final VoidCallback closeFunction;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Container(
            width: 70,
            height: 100,
            decoration: BoxDecoration(
              color: AppColors.dimWhiteColor,
              image: DecorationImage(
                  image: AssetImage(image![index]), fit: BoxFit.fitHeight),
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
                // Row(
                //   children: [
                //     const Text('Color: '),
                //     Container(
                //       width: 15,
                //       height: 15,
                //       decoration: BoxDecoration(
                //         // color: color,
                //         border: Border.all(width: 2, color: AppColors.whiteColor),
                //       ),
                //     )
                //   ],
                // ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2, color: AppColors.greyColor),
                            // color: AppColors.themeColor,
                            borderRadius: BorderRadius.circular(5)),
                        padding: const EdgeInsets.all(6),
                        child: const Text(
                          'Add to Cart',
                          style: TextStyle(color: AppColors.whiteColor),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2, color: AppColors.greyColor),
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
