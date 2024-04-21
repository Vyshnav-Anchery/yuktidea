import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/api/api_variables.dart';
import 'package:flutter_application_3/view/otp%20screen/otp_screen.dart';
import 'package:http/http.dart' as http;

class PhoneNumberController extends ChangeNotifier {
  TextEditingController phoneEditingController = TextEditingController();

  Future<bool?> sendOtp(bool isStudent, String countryCode, String phoneNum,
      BuildContext context) async {
    String urlPath = isStudent ? "student" : "counsellor";
    String url = "${baseUrl + urlPath}/login";
    Map<String, String> requestBody = {
      "tel_code": countryCode,
      "phone": phoneNum
    };
    var response = await http.post(
      Uri.parse(url),
      body: jsonEncode(requestBody),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      // Parse the response body
      var responseData = jsonDecode(response.body);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => OTPScreen(phoneNum: countryCode + phoneNum)));
      log(responseData.toString());
      return true;
    } else {
      log('Request failed with status: ${response.statusCode}');
      log('Response body: ${response.body}');
      return null;
    }
  }
}
