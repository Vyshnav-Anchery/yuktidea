import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/model/terms%20model/terms_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../core/api/api_variables.dart';

class TermsController extends ChangeNotifier {
  Future<TermsModel?> getTerms() async {
    Response response = await http.get(Uri.parse('${baseUrl}terms-conditions'));
    var data = jsonDecode(response.body.toString());
    return response.statusCode == 200 ? TermsModel.fromJson(data) : null;
  }
}
