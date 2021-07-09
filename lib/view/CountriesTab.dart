import 'package:flutter/material.dart';
import 'package:search_app/common/SearchBar.dart';
import '../model/Services.dart';
import '../model/CountryJsonData.dart';
import '../model/VisitedList.dart';
import '../common/ListTile.dart';
import '../common/Loading.dart';

class CountriesTab extends StatefulWidget {
  // CountriesTab();

  @override
  _CountriesTabState createState() => _CountriesTabState();
}

class _CountriesTabState extends State<CountriesTab> {
  static List<Country> _country = <Country>[];
  List<Country> _countryDisplay = <Country>[];
  static List<bool?> _isChecked = _isChecked = List<bool?>.filled(243, false);

  bool _isLoading = true;

  void initState() {
    fetchCountry().then((value) {
      setState(() {
        _isLoading = false;
        _country.addAll(value);
        _countryDisplay = _country;
      });
    });
    super.initState();
  }

  void visitedTabManager(index) {
    if (VisitedList().country.contains(_countryDisplay[index]) &&
        _isChecked[index] == false) {
      VisitedList().removeCountry(_countryDisplay[index]);
    } else {
      VisitedList().addCountry(_countryDisplay[index]);
    }
  }

  void searchBarManager(text) {
    _countryDisplay = _country.where((country) {
      var countryName = country.name.toLowerCase();
      return countryName.contains(text);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          if (_isLoading == false) {
            return index == 0
                ? SearchBar(_searchBar())
                : ListTileDisplay(_checkBox(index - 1));
          } else {
            return Loading();
          }
        },
        itemCount: _countryDisplay.length + 1,
      ),
    );
  }

  _searchBar() {
    return TextField(
      decoration: InputDecoration(hintText: "Search.."),
      onChanged: (text) {
        text = text.toLowerCase();
        setState(() {
          searchBarManager(text);
        });
      },
    );
  }

  _checkBox(index) {
    return CheckboxListTile(
      value: _isChecked[index],
      onChanged: (bool? value) {
        _isChecked[index] = value;
        setState(() {
          visitedTabManager(index);
        });
      },
      title: Text(
        _countryDisplay[index].name,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
