import 'package:flutter/material.dart';
import 'package:time4deal/helpers/app_text_styles.dart';

class CustomeAppBar extends StatelessWidget implements PreferredSize {
  const CustomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(45),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                children: const [
                  Text('Hello'),
                  Text(
                    'Name',
                    style: AppTextStyles.normalText,
                  ),
                ],
              ),
              const Spacer(),
              const Spacer(),
              IconButton(
                splashRadius: 15,
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
              IconButton(
                splashRadius: 15,
                onPressed: () {},
                icon: const Icon(Icons.favorite_outline_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  // ignore: todo
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 50);
}
