import 'package:flutter/material.dart';
import 'Services.dart';
import 'CountryJsonData.dart';

class CountriesTab extends StatefulWidget {
  final bool _isVisited;
  List<Country> _visitedCountries = <Country>[];
  CountriesTab(this._isVisited);

  @override
  _CountriesTabState createState() => _CountriesTabState();
}

class _CountriesTabState extends State<CountriesTab> {
  List<Country> _country = <Country>[];
  List<Country> _countryDisplay = <Country>[];

  int _selectedIndex = 0;
  _onSelected(int index) {
    setState(() => _selectedIndex = index);
    widget._visitedCountries.add((_countryDisplay[index]));
  }

  bool _isLoading = true;

  @override
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

  Widget build(BuildContext context) {
    return widget._isVisited == false
        ? Container(
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
          )
        : Container(
            child: ListView.builder(
              itemBuilder: (context, index) {
                if (_isLoading == false) {
                  return _visitedIndex(index);
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
              itemCount: widget._visitedCountries.length,
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
                widget._visitedCountries.add((_countryDisplay[index]));
                print("added to list");
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

  _visitedIndex(index) {
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
              title: Text(
                widget._visitedCountries[index].name,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ]);
  }

  @override
  void didUpdateWidget(CountriesTab oldWidget) {
    if (widget._visitedCountries != oldWidget._visitedCountries) {
      _CountriesTabState();
    }
    super.didUpdateWidget(oldWidget);

    print("didUpdateWidget");
  }
}
