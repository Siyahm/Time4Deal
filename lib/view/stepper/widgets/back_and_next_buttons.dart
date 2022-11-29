import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/stepper_controller/stepper_controller.dart';

class BackAndNextButtons extends StatelessWidget {
  const BackAndNextButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Icon(
          Icons.arrow_back_ios,
          size: 18,
        ),
        Consumer<StepperController>(
          builder: (context, value, child) => TextButton(
            style: TextButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minimumSize: const Size(5, 3),
                padding: EdgeInsets.zero),
            onPressed: () {
              value.onStepCancel();
            },
            child: const Text('Back'),
          ),
        ),
        SizedBox(
          width: size.width * 0.07,
        ),
        Consumer<StepperController>(
          builder: (context, value, child) => TextButton(
            style: TextButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minimumSize: const Size(5, 3),
                padding: EdgeInsets.zero),
            onPressed: () {
              value.onStepContinue();
            },
            child: const Text('Next'),
          ),
        ),
        const Icon(
          Icons.arrow_forward_ios,
          size: 18,
        ),
        SizedBox(
          width: size.width * 0.05,
        ),
      ],
    );
  }
}
