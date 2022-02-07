import 'dart:convert';

import 'package:http/http.dart' as http;

class StatServices {
  Future getStats() async {
    final response =
        await http.get(Uri.parse("https://disease.sh/v3/covid-19/all"));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Error");
    }
  }
}
