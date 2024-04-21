import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sms_autofill/sms_autofill.dart';
import '../core/api/api_variables.dart';

class OTPController extends ChangeNotifier {
  bool otpMatched = false;
  bool counterStarted = false;
  int resendCountdown = 30;
  Timer? countDownTimer;
  String otp = '';
  ValueNotifier<String> otpValueNotifier = ValueNotifier<String>('');
  TextEditingController otpEditingController = TextEditingController();

  listenOtp() {
    log("listen otp");

    SmsAutoFill().code.listen((String code) {
      otpEditingController.text = code;
      otp = code;
      otpValueNotifier = ValueNotifier<String>(code);
      log("otp");
    });
  }

  checkOtp(String otp, String phoneNum, BuildContext context) async {
    String url = "${baseUrl}verify-otp";
    Map<String, String> requestBody = {"code": otp, "phone": phoneNum};
    var response = await http.post(
      Uri.parse(url),
      body: jsonEncode(requestBody),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      // checking otp
      if (responseData['status'] == true) {
        otpMatched = true; //for changing error message
        notifyListeners();
      } else {
        otpMatched = false;
        notifyListeners();
      }
    } else {
      log('Request failed with status: ${response.statusCode}');
      log('Response body: ${response.body}');
      otpMatched = false;
      notifyListeners();
    }
  }

  resendOtp(String phoneNum) async {
    String url = "${baseUrl}resend-otp";
    Map<String, String> requestBody = {"phone": phoneNum};
    var response = await http.post(
      Uri.parse(url),
      body: jsonEncode(requestBody),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      await SmsAutoFill().listenForCode();
      listenOtp();
      startCountdown();
    }
  }

  void startCountdown() {
    resendCountdown = 30;
    counterStarted = true;
    notifyListeners();
    // Cancel the previous timer if running
    countDownTimer?.cancel();

    // Start a new countdown timer
    countDownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendCountdown == 0) {
        timer.cancel();
        counterStarted = false;
        notifyListeners();
      } else {
        resendCountdown--;
        notifyListeners();
      }
    });
  }
}
