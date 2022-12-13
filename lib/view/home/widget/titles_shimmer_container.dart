import 'package:flutter/cupertino.dart';
import 'package:time4deal/helpers/app_colors.dart';

class TitlesShimmerContainer extends StatelessWidget {
  const TitlesShimmerContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 260,
          height: 15,
          color: AppColors.whiteColor,
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          width: 260,
          height: 15,
          color: AppColors.whiteColor,
        ),
      ],
    );
  }
}
