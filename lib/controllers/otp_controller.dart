import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../core/api/api_variables.dart';

class OTPController extends ChangeNotifier {
  bool otpMatched = false;
  Future<bool?> checkOtp(
      String otp, String phoneNum, BuildContext context) async {
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

      log(responseData.toString());
      if (responseData['status'] == true) {
        otpMatched = true;
        notifyListeners();
        log("done");
        return true;
      } else {
        log("fail");
        otpMatched = false;
        notifyListeners();
        return false;
      }
    } else {
      log('Request failed with status: ${response.statusCode}');
      log('Response body: ${response.body}');
      otpMatched = false;
      notifyListeners();
      return false;
    }
  }
}
