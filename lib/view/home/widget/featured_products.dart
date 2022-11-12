import 'package:flutter/cupertino.dart';

class FeaturedProduct extends StatelessWidget {
  const FeaturedProduct({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
      decoration: BoxDecoration(
        // border: Border.all(width: 1, color: AppColors.whiteColor),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(image),
        ),
      ),
    );
  }
}
