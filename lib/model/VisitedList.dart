import 'package:flutter/material.dart';
import 'CountryJsonData.dart';

class VisitedList extends ChangeNotifier {
  static List<Country> _visitedCountries = [];
  static List<String> _listVisited = [];

  List<Country> get country => _visitedCountries;
  List<String> get visitedCountry => _listVisited;

  void addCountry(Country country) {
    _visitedCountries.add(country);
    _listVisited.add(country.name);
    notifyListeners();
  }

  void removeCountry(Country country) {
    _visitedCountries.remove(country);
    _listVisited.remove(country.name);
    notifyListeners();
  }
}
