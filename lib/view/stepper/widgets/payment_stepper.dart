import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/stepper_controller/stepper_controller.dart';
import 'package:time4deal/utils/payment_enum.dart';

class PaymentStepper extends StatelessWidget {
  const PaymentStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StepperController>(
      builder: (context, value, child) => Column(
        children: [
          ListTile(
            leading: Radio(
              value: PaymentEnum.cashOnDelivery,
              groupValue: value.currentEnum,
              onChanged: (newValue) {
                value.selectPayment(newValue!);
              },
            ),
            title: const Text('Cash on delivery'),
          ),
          ListTile(
            leading: Radio(
              value: PaymentEnum.onlinePayment,
              groupValue: value.currentEnum,
              onChanged: (newValue) {
                value.selectPayment(newValue!);
              },
            ),
            title: const Text('Pay online'),
          ),
        ],
      ),
    );
  }
}
