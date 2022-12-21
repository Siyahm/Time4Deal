import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/add_address_screen_controller/add_address_controller.dart';

class RadioButtonsRow extends StatelessWidget {
  const RadioButtonsRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddAddressController>(
      builder: (context, value, child) => Row(
        children: [
          Expanded(
            child: ListTile(
              leading: Radio(
                value: AddressTitle.home,
                groupValue: value.addressTitle,
                onChanged: (newValue) {
                  value.changeRadioValue(newValue!);
                },
              ),
              title: const Text('Home'),
            ),
          ),
          Expanded(
            child: ListTile(
              leading: Radio(
                value: AddressTitle.office,
                groupValue: value.addressTitle,
                onChanged: (newValue) {
                  value.changeRadioValue(newValue!);
                },
              ),
              title: const Text('Office'),
            ),
          ),
        ],
      ),
    );
  }
}
