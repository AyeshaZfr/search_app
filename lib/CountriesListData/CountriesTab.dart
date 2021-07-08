import 'package:flutter/material.dart';
import 'Services.dart';
import 'CountryJsonData.dart';

class CountriesTab extends StatefulWidget {
  CountriesTab();

  @override
  _CountriesTabState createState() => _CountriesTabState();
}

class _CountriesTabState extends State<CountriesTab> {
  List<Country> _country = <Country>[];
  List<Country> _countryDisplay = <Country>[];
  // List<bool?> _isChecked = <bool?>[];
  int _selectedIndex = 0;

  _onSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool _isLoading = true;
  bool _isChecked = true;

  @override
  void initState() {
    fetchCountry().then((value) {
      setState(() {
        _isLoading = false;
        _country.addAll(value);
        _countryDisplay = _country;
        // _isChecked = List<bool?>.filled(_countryDisplay.length, false);
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          if (_isLoading == false) {
            return index == 0 ? _searchBar() : _listItem(index - 1);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        itemCount: _countryDisplay.length + 1,
      ),
    );
  }

  _searchBar() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextField(
        decoration: InputDecoration(hintText: "Search.."),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            _countryDisplay = _country.where((country) {
              var countryName = country.name.toLowerCase();
              return countryName.contains(text);
            }).toList();
          });
        },
      ),
    );
  }

  _listItem(index) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: _selectedIndex == index ? Colors.blue : Colors.white,
            ),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: ListTile(
              onLongPress: () {
                setState(() {
                  if (!VisitedList().country.contains(_countryDisplay[index])) {
                    VisitedList().addCountry(_countryDisplay[index]);
                  }

                  _isChecked = true;
                });
              },
              onTap: () => _onSelected(index),
              title: Text(
                _countryDisplay[index].name,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ]);
  }
}

class VisitedList extends ChangeNotifier {
  static List<Country> _visitedCountries = [];
  List<Country> get country => _visitedCountries;
  void addCountry(Country country) {
    _visitedCountries.add(country);
    notifyListeners();
  }
}
