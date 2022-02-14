import 'dart:convert';
import 'api_data.dart';

import 'package:covid_tracker/services/api_data.dart';
import 'package:http/http.dart' as http;

class StatServices {
  Future getStats() async {
    final response =
        await http.get(Uri.parse("https://disease.sh/v3/covid-19/all"));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return ApiData.fromJson(data);
    } else {
      throw Exception("Error");
    }
  }

  Future getCountries() async {
    final response =
        await http.get(Uri.parse("https://disease.sh/v3/covid-19/countries"));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
      // return ApiData.fromJson(data);

    } else {
      throw Exception("Error");
    }
  }
}
