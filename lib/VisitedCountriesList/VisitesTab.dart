import 'package:flutter/material.dart';
import 'package:search_app/CountriesListData/CountriesTab.dart' as countries;
import 'package:provider/provider.dart';

class VisitedCountries extends StatefulWidget {
  @override
  _VisitedCountriesState createState() => _VisitedCountriesState();
}

class _VisitedCountriesState extends State<VisitedCountries> {
  void didUpdateWidget(VisitedCountries oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<countries.VisitedList>(
        builder: (context, VisitedList, child) {
      return Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: ListTile(
                      title: Text(
                        VisitedList.country[index].name,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ]);
          },
          itemCount: VisitedList.country.length,
        ),
      );
    });
  }
}
