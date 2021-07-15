import 'package:flutter/material.dart';
import 'CountryJsonData.dart';

class VisitedList extends ChangeNotifier {
  static List<Country> _visitedCountries = [];

  List<Country> get country => _visitedCountries;

  void addCountry(Country country) {
    _visitedCountries.add(country);

    notifyListeners();
  }

  void removeCountry(Country country) {
    _visitedCountries.remove(country);

    notifyListeners();
  }
}
