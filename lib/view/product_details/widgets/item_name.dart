import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/home_controller/home_controller.dart';
import 'package:time4deal/controller/product_details_controller/product_details_controller.dart';
import 'package:time4deal/helpers/app_text_styles.dart';

class ItemName extends StatelessWidget {
  const ItemName({
    Key? key,
    // required this.index,
    // required this.model,
  }) : super(key: key);

  // final int index;

  // final ProductModel? model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final homeController = Provider.of<HomeController>(context, listen: false);
    // final wishListController =
    //     Provider.of<WishListController>(context, listen: false);
    final productDetailsController =
        Provider.of<ProductDetailsContoller>(context);
    return Row(
      children: [
        SizedBox(
          width: size.width * 0.75,
          child: Text(
            productDetailsController.isLoading
                ? ''
                : productDetailsController.product!.name,
            softWrap: true,
            style: AppTextStyles.head1,
          ),
        ),
        const Spacer(),
        Consumer<HomeController>(
          builder: (context, value, child) => IconButton(
            onPressed: () {
              // value.addFavourite(index);
            },
            icon: const Icon(
              Icons.favorite_outlined,
            ),
          ),
        )
      ],
    );
  }
}
