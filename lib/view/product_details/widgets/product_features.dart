import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/product_details_controller/product_details_controller.dart';
import 'package:time4deal/view/product_details/widgets/features.dart';

class ProductFeatures extends StatelessWidget {
  const ProductFeatures({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailsContoller>(
      builder: (context, value, child) => Row(
        children: [
          Features(
            feature1: 'Type:',
            text1: 'Sports',
            feature2: 'Band width:',
            text2: value.isLoading ? '--' : value.product!.size[0],
          ),
          const Spacer(),
          const Features(
            feature1: 'Display Type:',
            text1: 'Digital',
            feature2: 'Band color:',
            text2: 'Black',
          ),
          const Spacer(),
          const Features(
            feature1: 'Display color:',
            text1: 'Black',
            feature2: 'Warrenty',
            text2: '1 year',
          ),
        ],
      ),
    );
  }
}
