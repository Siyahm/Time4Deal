import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:time4deal/routes/rout_names.dart';

class CustomeAppBar extends StatelessWidget implements PreferredSize {
  const CustomeAppBar({
    Key? key,
    required this.leadingWidget,
  }) : super(key: key);

  final Widget leadingWidget;

  @override
  Widget build(BuildContext context) {
    // final signInProvider = Provider.of<SignInProvider>(context);
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                leadingWidget,
                const Spacer(),
                const Spacer(),
                IconButton(
                  splashRadius: 15,
                  onPressed: () async {
                    await GoogleSignIn().signOut();
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
            ),
          ],
        ),
      ),
    );
  }

  @override
  // ignore: todo
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 80);
}
