import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/add_address_screen_controller/add_address_controller.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/app_padding.dart';
import 'package:time4deal/helpers/app_text_styles.dart';
import 'package:time4deal/utils/common_functions.dart';
import 'package:time4deal/utils/common_validations.dart';
import 'package:time4deal/widgets/custome_app_bar.dart';
import 'package:time4deal/widgets/custome_text_form_field.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addressFormKey = GlobalKey<FormState>();
    final addAddressController =
        Provider.of<AddAddressController>(context, listen: false);
    return Scaffold(
      appBar: CustomeAppBar(
        leadingWidget: IconButton(
          onPressed: () {
            CommonFunctions.popFunction(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        trailing: const SizedBox(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.horizPadding10,
          child: Form(
            key: addressFormKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Address Details',
                      style: AppTextStyles.subTitle,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: AppColors.whiteColor)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: const Text('Pick current address'),
                      ),
                    )
                  ],
                ),
                CustomTextFormField(
                    text: 'Name',
                    controller: addAddressController.nameController,
                    validation: ((String? value) {
                      CommonValidations.nameValidation(value);
                    }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
