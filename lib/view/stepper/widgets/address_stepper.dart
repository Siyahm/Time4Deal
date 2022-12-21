import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/add_address_screen_controller/add_address_controller.dart';
import 'package:time4deal/controller/stepper_controller/stepper_controller.dart';
import 'package:time4deal/helpers/app_colors.dart';

class AddressStepper extends StatelessWidget {
  const AddressStepper({super.key});

  @override
  Widget build(BuildContext context) {
    final stepperController =
        Provider.of<StepperController>(context, listen: false);
    final addAddressController =
        Provider.of<AddAddressController>(context, listen: false);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Icon(
              Icons.add,
              color: AppColors.blueColor,
            ),
            TextButton(
              onPressed: () {
                addAddressController.clearControllers();
                stepperController.onClickAddAddress(context);
              },
              child: const Text('Add Address'),
            ),
          ],
        ),
        Consumer<StepperController>(
            builder: (context, value, child) => ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      value.changeRadio(index);
                    },
                    child: ListTile(
                      leading: Radio(
                        value: index,
                        groupValue: value.currentRadio,
                        onChanged: (newIndex) {
                          value.changeRadio(newIndex!);
                        },
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(value.addressList[index].name!),
                          Text(value.addressList[index].address!),
                          Text(value.addressList[index].landMark!),
                          Text(value.addressList[index].mobNum!)
                        ],
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            value.removeAddress(index);
                          },
                          icon: const Icon(Icons.close)),
                    ),
                  ),
                  itemCount: value.addressList.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                )),
      ],
    );
  }
}
