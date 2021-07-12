import 'package:flutter/material.dart';
import 'package:search_app/model/VisitedList.dart';
import 'package:provider/provider.dart';
import 'package:search_app/common/ListTile.dart';

class VisitedCountries extends StatefulWidget {
  @override
  _VisitedCountriesState createState() => _VisitedCountriesState();
}

class _VisitedCountriesState extends State<VisitedCountries> {
  void initState() {
    setState(() {
      _VisitedCountriesState();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VisitedList>(builder: (context, VisitedList, child) {
      _listTile(index) {
        return ListTile(
          title: Text(
            VisitedList.country[index].name,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        );
      }

      return Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTileDisplay(_listTile(index));
          },
          itemCount: VisitedList.country.length,
        ),
      );
    });
  }
}
