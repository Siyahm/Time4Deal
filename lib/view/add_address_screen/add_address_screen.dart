import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/add_address_screen_controller/add_address_controller.dart';
import 'package:time4deal/controller/stepper_controller/stepper_controller.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/app_padding.dart';
import 'package:time4deal/helpers/app_text_styles.dart';
import 'package:time4deal/helpers/sized_boxes.dart';
import 'package:time4deal/utils/common_validations.dart';
import 'package:time4deal/view/add_address_screen/widgets/loading_screen.dart';
import 'package:time4deal/view/add_address_screen/widgets/radio_buttons_row.dart';
import 'package:time4deal/widgets/custom_app_bar_leading.dart';
import 'package:time4deal/widgets/custome_app_bar.dart';
import 'package:time4deal/widgets/custome_text_form_field.dart';
import 'package:time4deal/widgets/long_elevated_button.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final addressFormKey = GlobalKey<FormState>();
    final addAddressController =
        Provider.of<AddAddressController>(context, listen: false);
    final stepperController =
        Provider.of<StepperController>(context, listen: false);
    return Scaffold(
      appBar: const CustomeAppBar(
        leadingWidget: CustomAppBarLeadingWidget(),
        trailing: SizedBox(),
      ),
      body: Consumer<AddAddressController>(
        builder: (context, value, child) => value.isLoading
            ? const LoadingScreen()
            : SingleChildScrollView(
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
                              onTap: () {
                                addAddressController.getCurrentLocation();
                              },
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
                        SizedBoxes.heightBox30,
                        const RadioButtonsRow(),
                        SizedBoxes.heightBox30,

                        CustomTextFormField(
                          text: 'Full Name (Required)*',
                          controller: addAddressController.nameController,
                          validation: (String? value) {
                            return CommonValidations.nameValidation(value);
                          },
                        ),
                        SizedBoxes.heightBox10,
                        CustomTextFormField(
                          text: 'Address (Required)*',
                          controller: addAddressController.addressController,
                          validation: (String? value) {
                            return CommonValidations.addressValidation(value);
                          },
                        ),
                        SizedBoxes.heightBox10,
                        CustomTextFormField(
                          text: 'Pin code (Required)*',
                          controller: addAddressController.pincodeController,
                          validation: (String? value) {
                            return CommonValidations.cityValidation(
                                value, 'Please enter your pincode');
                          },
                        ),
                        SizedBoxes.heightBox10,
                        CustomTextFormField(
                          text: 'Place (Required)*',
                          controller: addAddressController.placeController,
                          validation: (String? value) {
                            return CommonValidations.cityValidation(
                                value, 'Please enter your place');
                          },
                        ),
                        SizedBoxes.heightBox10,
                        CustomTextFormField(
                          text: 'State (Required)*',
                          controller: addAddressController.placeController,
                          validation: (String? value) {
                            return CommonValidations.cityValidation(
                                value, 'Please enter State');
                          },
                        ),
                        SizedBoxes.heightBox10,
                        CustomTextFormField(
                          text: 'Landmark (Required)*',
                          controller: addAddressController.landmarkController,
                          validation: (String? value) {
                            return CommonValidations.cityValidation(
                                value, 'Please enter landmark');
                          },
                        ),

                        SizedBoxes.heightBox10,
                        CustomTextFormField(
                          text: 'Mobile Number (Required)*',
                          controller: addAddressController.mobController,
                          validation: (String? value) {
                            return CommonValidations.mobValidation(value);
                          },
                        ),
                        const SizedBox(
                          height: 50,
                        ),

                        // const Spacer(),
                        SizedBox(
                          width: double.infinity,
                          // height: size.height * 1,
                          child: LongElevatedButton(
                            onPressed: () {
                              addAddressController.onClickSaveButton(
                                  stepperController.addressList,
                                  context,
                                  addressFormKey);
                            },
                            color: AppColors.dimWhiteColor,
                            child: const Text(
                              'Save',
                              style: AppTextStyles.buttonTextBlack,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
