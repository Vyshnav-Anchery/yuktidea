import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/controllers/otp_controller.dart';
import 'package:flutter_application_3/core/common%20widgets/gradient_divider.dart';
import 'package:flutter_application_3/core/common%20widgets/otp_field.dart';
import 'package:flutter_application_3/core/constants/app_theme.dart';
import 'package:flutter_application_3/main.dart';
import 'package:provider/provider.dart';

import '../../core/common widgets/close_button.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key, required this.phoneNum});
  final String phoneNum;
  @override
  Widget build(BuildContext context) {
    String otp = '';
    bool otpMatched = true;
    OTPController otpController =
        Provider.of<OTPController>(context, listen: false);
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
                  OTPInputField(
                    onChanged: (text) {
                      otp = text;

                      log(text);
                    },
                  ),
                  const SizedBox(height: 20),
                  Consumer<OTPController>(
                    builder: (context, otpProvider, child) {
                      if (!otpProvider.otpMatched) {
                        return const Text(
                          "OTP does not match, please try again",
                          style: TextStyle(color: Colors.red),
                        );
                      } else {
                        return Container(); // Return an empty widget if OTP matches
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text("Didn't receive OTP?", style: TextStyle()),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Resend OTP",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.appPrimaryColor),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      otpController.checkOtp(otp, phoneNum, context);
                    },
                    child: const Text('Verify'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
