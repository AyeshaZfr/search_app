// import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'CountryJsonData.dart';
import 'CountryJsonData.dart';
import 'package:http/http.dart' as http;

List<Country> parseCountry(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  var countries = list.map((model) => Country.fromJson(model)).toList();
  return countries;
}

Future<List<Country>> fetchCountry() async {
  final response = await http
      .get(Uri.parse('https://api.jsonbin.io/b/60e49d6efe016b59dd5dd6ee/1'));
  if (200 == response.statusCode) {
    return compute(parseCountry, response.body);
  } else {
    throw Exception("API Request Errot");
  }
}
