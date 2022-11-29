import 'package:flutter/material.dart';
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
          onPressed: () {
            Navigator.of(context).pushNamed(RouteNames.myCart);
          },
          icon: const Icon(Icons.shopping_cart_outlined),
        ),
      ],
    );
  }
}
