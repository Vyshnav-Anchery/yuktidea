import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/controllers/otp_controller.dart';
import 'package:flutter_application_3/core/common%20widgets/custom_button.dart';
import 'package:flutter_application_3/core/common%20widgets/gradient_divider.dart';
import 'package:flutter_application_3/core/constants/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../core/common widgets/close_button.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key, required this.phoneNum});
  final String phoneNum;
  @override
  Widget build(BuildContext context) {
    OTPController otpController =
        Provider.of<OTPController>(context, listen: false);
    otpController.listenOtp();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Align(
                alignment: Alignment.topLeft,
                child: CustomCloseButton(
                  icon: Icons.arrow_back_ios_new_rounded,
                )),
            const SizedBox(height: 50),
            const Text("Verify Number", style: TextStyle(fontSize: 25)),
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    child: ListenableBuilder(
                        listenable: otpController.otpValueNotifier,
                        builder: (context, child) {
                          return PinFieldAutoFill(
                            decoration: UnderlineDecoration(
                                colorBuilder:
                                    FixedColorBuilder(AppTheme.textfieldColor)),
                            codeLength: 4,
                            controller: otpController.otpEditingController,
                            currentCode: otpController.otp,
                            enabled: true,
                            onCodeChanged: (text) {
                              if (text == null) {
                                return null;
                              }
                              if (text.length >= 3) {
                                otpController.otp = text;
                              }
                            },
                            keyboardType: TextInputType.number,
                          );
                        }),
                  ),
                  // OTPInputField(
                  //   onChanged: (text) {
                  //     otpController.otp = text; //to get otp as a single string
                  //   },
                  // ),
                  const SizedBox(height: 20),
                  Consumer<OTPController>(
                    builder: (context, otpProvider, child) {
                      if (otpProvider.otpMatched) {
                        return Container();
                      } else {
                        return const Text(
                          "OTP does not match, please try again",
                          style: TextStyle(color: Colors.red),
                        ); // Return an empty widget if OTP matches
                      }
                    },
                  ),
                  const Text("Didn't receive OTP?", style: TextStyle()),
                  TextButton(
                    onPressed: () {
                      otpController.resendOtp(phoneNum);
                    },
                    child: Text(
                      "Resend OTP",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.appPrimaryColor),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Consumer<OTPController>(
                    builder: (context, otpProvider, child) {
                      if (otpProvider.counterStarted) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "Resending OTP in ",
                            ),
                            Text(
                              "${otpProvider.resendCountdown} seconds",
                              style: TextStyle(color: AppTheme.appPrimaryColor),
                            ),
                          ],
                        );
                      } else {
                        return Container(); // Return an empty widget if OTP matches
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    onPressed: () {
                      otpController.checkOtp(
                          otpController.otp, phoneNum, context);
                      log(otpController.otpMatched.toString());
                    },
                    text: 'Verify',
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
