import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/model/country%20model/country_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../core/api/api_variables.dart';

class CountrySelectionController extends ChangeNotifier {
  late List<Datum> _countries = [];
  late List<Datum> filteredCountries = [];
  late TextEditingController searchController = TextEditingController();

  Future<CountryModel?> getCountries() async {
    Response response = await http.get(Uri.parse('${baseUrl}countries'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      _countries = CountryModel.fromJson(data).data!;
      filteredCountries = _countries;
      return CountryModel.fromJson(data);
    } else {
      return null;
    }
  }

  void filterCountries(String query) {
    query.trim().toLowerCase();
    filteredCountries = _countries
        .where(
            (country) => country.name!.toLowerCase().toString().contains(query))
        .toList();
    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
