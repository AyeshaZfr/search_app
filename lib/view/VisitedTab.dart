import 'package:flutter/material.dart';
import 'package:search_app/model/CountryJsonData.dart';
import 'package:search_app/model/VisitedList.dart';
import 'package:provider/provider.dart';
import 'package:search_app/common/ListTile.dart';
import '../common/Loading.dart';
import 'package:search_app/common/SearchBar.dart';

class VisitedCountries extends StatefulWidget {
  @override
  _VisitedCountriesState createState() => _VisitedCountriesState();
}

class _VisitedCountriesState extends State<VisitedCountries> {
  bool _isLoading = true;
  TextEditingController ctrl = new TextEditingController();
  List<Country> _listVisited = [];
  bool reload = false;
  void initState() {
    setState(() {
      _VisitedCountriesState();
      _isLoading = false;
      reload = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VisitedList>(builder: (context, VisitedList, child) {
      if (reload) {
        _listVisited = VisitedList.country;
      }

      onChanged(text) {
        reload = false;
        setState(() {
          _listVisited = [];

          _listVisited = VisitedList.country.where((country) {
            var countryName = country.name.toLowerCase();
            if (!_listVisited.contains(countryName.contains(text))) {
              return countryName.contains(text);
            } else {
              return false;
            }
          }).toList();
        });
      }

      _listTile(index) {
        return ListTile(
          title: Text(
            _listVisited[index].name,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        );
      }

      return Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            if (_isLoading == false) {
              return index == 0
                  ? SearchBar(
                      ctrl: ctrl,
                      onChanged: onChanged,
                    )
                  : ListTileDisplay(_listTile(index - 1));
            } else {
              return Loading();
            }
          },
          itemCount: _listVisited.length + 1,
        ),
      );
    });
  }
}
