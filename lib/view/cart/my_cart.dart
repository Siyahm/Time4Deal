import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/constants/app_urls.dart';
import 'package:time4deal/controller/cart_controller/cart_controller.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/app_text_styles.dart';
import 'package:time4deal/utils/app_utils.dart';
import 'package:time4deal/view/cart/widgets/custom_cart_list_tile.dart';
import 'package:time4deal/widgets/add_buy_elevated_buttons.dart';
import 'package:time4deal/widgets/custome_app_bar.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomeAppBar(
        leadingWidget: IconButton(
          onPressed: () {
            AppUtils.popFunction(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: 'My Cart',
        trailing: IconButton(
          splashRadius: 15,
          onPressed: () async {
            // await GoogleSignIn().signOut();
          },
          icon: const Icon(Icons.search),
        ),
      ),
      body: SafeArea(
        child: Consumer<CartController>(
          builder: (context, value, child) => value.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : value.cartList.isEmpty
                  ? const Center(
                      child: Text('My cart screen'),
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) =>
                                  CustomCartListTile(
                                    image:
                                        '${AppUrls.networkImageMainUrl}products/${value.cartList[index].image[0]}',
                                    name: value.cartList[index].name,
                                    brand: 'Brand',
                                    index: index,
                                  ),
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                    height: 10,
                                  ),
                              itemCount: value.cartList.length),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: size.height * 0.06,
                                color: AppColors.whiteColor,
                                alignment: Alignment.center,
                                child: const Text(
                                  'Total amout',
                                  style: AppTextStyles.normalTextBlack,
                                ),
                              ),
                            ),
                            AddAndBuyElevatedButton(
                              color: AppColors.redColor,
                              label: 'Check out',
                              ontap: () {},
                              labelStyle: AppTextStyles.normalText,
                            ),
                          ],
                        )
                      ],
                    ),
        ),
      ),
    );
  }
}
