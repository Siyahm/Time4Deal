import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/product_details_controller/product_details_controller.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/app_padding.dart';

class BrandColors extends StatelessWidget {
  const BrandColors({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productDetailsController =
        Provider.of<ProductDetailsContoller>(context, listen: false);
    return Expanded(
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) => Container(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: AppPadding.horizPadding5,
                    child: Consumer<ProductDetailsContoller>(
                      builder: (context, value, child) => GestureDetector(
                        onTap: () {
                          value.onSelectColor(index);
                        },
                        child: CircleAvatar(
                            radius: value.listIndex == index ? 15 : 10,
                            backgroundColor: AppColors.whiteColor,
                            child: CircleAvatar(
                              backgroundColor: value.itemColors[index],
                              radius:
                                  productDetailsController.listIndex == index
                                      ? 13
                                      : 8,
                            )),
                      ),
                    ),
                  ),
                )
            // productDetailsController.itemColors[index]
            ),
      ),
    );
  }
}
