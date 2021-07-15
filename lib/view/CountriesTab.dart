import 'package:flutter/material.dart';
import 'package:search_app/common/SearchBar.dart';
import '../model/Services.dart';
import '../model/CountryJsonData.dart';
import '../model/VisitedList.dart';
import '../common/ListTile.dart';
import '../common/Loading.dart';

class CountriesTab extends StatefulWidget {
  @override
  _CountriesTabState createState() => _CountriesTabState();
}

class _CountriesTabState extends State<CountriesTab> {
  static List<Country> _country = <Country>[];
  List<Country> _countryDisplay = <Country>[];

  bool _isLoading = true;

  void initState() {
    fetchCountry().then((value) {
      setState(() {
        _isLoading = false;
        _country.addAll(value);
        if (!_countryDisplay.contains(value)) {
          _countryDisplay = _country;
        }
      });
    });
    super.initState();
  }

  void visitedTabManager(index) {
    if (VisitedList().country.contains(_countryDisplay[index])) {
      VisitedList().removeCountry(_countryDisplay[index]);
    } else {
      VisitedList().addCountry(_countryDisplay[index]);
    }
  }

  TextEditingController ctrl = new TextEditingController();

  onChanged(text) {
    setState(() {
      _countryDisplay = [];
      _countryDisplay = _country.where((country) {
        var countryName = country.name.toLowerCase();
        if (!_countryDisplay.contains(countryName.contains(text))) {
          return countryName.contains(text);
        } else {
          return false;
        }
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          if (_isLoading == false) {
            return index == 0
                ? SearchBar(
                    ctrl: ctrl,
                    onChanged: onChanged,
                  )
                : ListTileDisplay(_checkBox(index - 1));
          } else {
            return Loading();
          }
        },
        itemCount: _countryDisplay.length + 1,
      ),
    );
  }

  _checkBox(index) {
    return CheckboxListTile(
      value: _countryDisplay[index].isVisited,
      onChanged: (bool? value) {
        _countryDisplay[index].isVisited = value;
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
