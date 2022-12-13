import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:time4deal/controller/stepper_controller/stepper_controller.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/view/stepper/widgets/address_stepper.dart';
import 'package:time4deal/view/stepper/widgets/order_details_stepper.dart';
import 'package:time4deal/view/stepper/widgets/payment_stepper.dart';
import 'package:time4deal/widgets/custom_app_bar_leading.dart';
import 'package:time4deal/widgets/custome_app_bar.dart';

class StepperScreen extends StatefulWidget {
  const StepperScreen({super.key});

  @override
  State<StepperScreen> createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  late StepperController stepperController;
  @override
  void initState() {
    stepperController = Provider.of<StepperController>(context, listen: false);
    stepperController.razorPay = Razorpay();
    stepperController.razorPayInit();
    super.initState();
  }

  @override
  void dispose() {
    stepperController.razorPay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final stepperController = Provider.of<StepperController>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomeAppBar(
        leadingWidget: CustomAppBarLeadingWidget(),
        trailing: SizedBox(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Consumer<StepperController>(
                builder: (context, value, child) => Stepper(
                  // physics: NeverScrollableScrollPhysics(),
                  currentStep: value.currentIndex,
                  onStepTapped: (index) => value.onStepTap(index),
                  onStepContinue: () => value.onStepContinue(context),
                  onStepCancel: () => value.onStepCancel(),
                  controlsBuilder: (context, details) => const SizedBox(),
                  type: StepperType.horizontal,
                  steps: [
                    Step(
                      isActive: value.currentIndex >= 0,
                      state: value.currentIndex >= 0
                          ? StepState.complete
                          : StepState.disabled,
                      title: const Text('Address'),
                      content: const AddressStepper(),
                    ),
                    Step(
                      isActive: value.currentIndex >= 0,
                      state: value.currentIndex >= 1
                          ? StepState.complete
                          : StepState.disabled,
                      title: const Text('Oreder Details'),
                      content: const OrderDetailsStepper(),
                    ),
                    Step(
                      isActive: value.currentIndex >= 0,
                      state: value.currentIndex >= 2
                          ? StepState.complete
                          : StepState.disabled,
                      title: const Text('Payment'),
                      content: const PaymentStepper(),
                    ),
                  ],
                ),
              ),
            ),
            Consumer<StepperController>(
                builder: (context, value, child) => SizedBox(
                      width: size.width * 1,
                      height: size.height * 0.06,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.redColor),
                        onPressed: () {
                          value.onStepContinue(context);
                        },
                        child: Text(
                          value.stepperContinueButtonLabel[value.currentIndex],
                        ),
                      ),
                    )),
            SizedBox(
              height: size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
