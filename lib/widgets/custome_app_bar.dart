import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/products_view_screen_controller/product_view_screen_controller.dart';
import 'package:time4deal/helpers/app_text_styles.dart';

class CustomeAppBar extends StatelessWidget implements PreferredSize {
  const CustomeAppBar({
    Key? key,
    required this.leadingWidget,
    this.title,
    required this.trailing,
  }) : super(key: key);

  final Widget leadingWidget;
  final String? title;
  final Widget trailing;

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
            Consumer<ProductViewScreenController>(
              builder: (context, value, child) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  leadingWidget,
                  title != null
                      ? Text(
                          title!,
                          style: AppTextStyles.subTitle,
                        )
                      : const SizedBox(),
                  trailing,
                ],
              ),
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
