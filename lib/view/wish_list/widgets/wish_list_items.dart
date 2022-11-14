import 'package:flutter/material.dart';
import 'package:time4deal/helpers/app_colors.dart';

class WishListItemTile extends StatelessWidget {
  const WishListItemTile({
    super.key,
    required this.image,
    required this.name,
    required this.company,
    required this.rate,
    required this.color,
    required this.closeFunction,
  });
  final String? image;
  final String? name;
  final String? company;
  final String? rate;
  final String? color;
  final VoidCallback closeFunction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image(
        image: AssetImage(image!),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name!,
            style: const TextStyle(fontSize: 18, color: AppColors.themeColor),
          ),
          Text('₹ ${rate!}'),
          Text(
            color!,
            style: const TextStyle(color: AppColors.greyColor),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: AppColors.greyColor),
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
                      border: Border.all(width: 2, color: AppColors.greyColor),
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
      trailing: IconButton(
          splashRadius: 15,
          onPressed: () {
            closeFunction();
          },
          icon: const Icon(Icons.close)),
    );
  }
}
