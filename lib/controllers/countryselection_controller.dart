import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/model/country%20model/country_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../core/api/api_variables.dart';

class CountrySelectionController extends ChangeNotifier {
  Future<CountryModel?> getCountries() async {
    Response response = await http.get(Uri.parse('${baseUrl}countries'));
    var data = jsonDecode(response.body.toString());
    return response.statusCode == 200 ? CountryModel.fromJson(data) : null;
  }
}
