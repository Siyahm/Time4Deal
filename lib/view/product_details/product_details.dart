import 'package:flutter/material.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/widgets/custome_app_bar.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          width: size.width * 0.5,
          height: size.height * 0.6,
          decoration: const BoxDecoration(
            color: AppColors.themeColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: AppColors.transperantColor,
          appBar: const CustomeAppBar(
            leadingWidget: Icon(Icons.arrow_back_ios),
          ),
          body: Column(
            children: [
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text('Brand'),
                      Text('Strap'),
                      Text('Color'),
                      Text('Warrenty'),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    height: size.height * 0.4,
                    width: size.width * 0.8,
                    child: const Image(
                      image: AssetImage('lib/assets/watch pic 1.png'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
