import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/cart_controller/cart_controller.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/routes/rout_names.dart';

class CustomAppbarTrailing extends StatelessWidget {
  const CustomAppbarTrailing({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          splashRadius: 15,
          onPressed: () async {
            // await GoogleSignIn().signOut();
          },
          icon: const Icon(Icons.search),
        ),
        IconButton(
          splashRadius: 15,
          onPressed: () async {
            await Navigator.of(context).pushNamed(RouteNames.myCart);
          },
          icon: Stack(
            alignment: Alignment.bottomLeft,
            fit: StackFit.loose,
            children: [
              const SizedBox(
                height: 30,
                width: 30,
              ),
              const Icon(Icons.shopping_cart_outlined),
              Positioned(
                top: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 9,
                  backgroundColor: AppColors.redColor,
                  child: Consumer<CartController>(
                      builder: (context, value, child) => Text(
                            value.cartList.length.toString(),
                            style: const TextStyle(color: AppColors.whiteColor),
                          )),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
