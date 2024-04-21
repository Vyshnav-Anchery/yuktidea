import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/common%20widgets/custom_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../controllers/phone_number_controller.dart';
import '../../core/common widgets/close_button.dart';
import '../../core/common widgets/gradient_divider.dart';
import '../../core/constants/app_theme.dart';

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen(
      {super.key,
      required this.countryCode,
      required this.flagUrl,
      required this.isStudent});
  final String countryCode;
  final String flagUrl;
  final bool isStudent;
  @override
  Widget build(BuildContext context) {
    PhoneNumberController phoneNumberController =
        Provider.of<PhoneNumberController>(context, listen: false);

    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            child: const Align(
                alignment: Alignment.topLeft,
                child: CustomCloseButton(
                  icon: Icons.arrow_back_ios_new_rounded,
                )),
          ),
          const SizedBox(height: 50),
          const Text("Enter phone number", style: TextStyle(fontSize: 25)),
          const SizedBox(height: 30),
          Text(
            'Please enter your 10 digit mobilenumber to receive OTP',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: AppTheme.appPrimaryColor),
          ),
          const SizedBox(height: 50),
          const GradientDivider(),
          const SizedBox(height: 20),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(50),
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: phoneNumberController.phoneEditingController,
                      validator: (value) {
                        if (value == null) {
                          return "Enter valid mobile number";
                        }
                        value.trim();
                        if (value.length < 7) {
                          return "Enter valid mobile number";
                        } else {
                          return null;
                        }
                      },
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      maxLength: 15,

                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        counter: const Text(""),
                        prefixIcon: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 24,
                              width: 36,
                              child: SvgPicture.network(
                                flagUrl,
                                fit: BoxFit.fill,
                                placeholderBuilder: (context) {
                                  return Center(
                                      child: SizedBox(
                                    height: 15,
                                    width: 15,
                                    child: CircularProgressIndicator(
                                      color: AppTheme.appPrimaryColor,
                                    ),
                                  ));
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            // Country code
                            Text(
                              countryCode,
                              style: const TextStyle(fontSize: 16.0),
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                        hintText: 'Enter your phone number',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                CustomButton(
                  text: "Get OTP",
                  onPressed: () {
                    phoneNumberController.sendOtp(
                        isStudent,
                        countryCode,
                        phoneNumberController.phoneEditingController.text,
                        context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
