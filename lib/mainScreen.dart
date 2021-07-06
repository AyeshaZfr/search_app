import 'package:flutter/material.dart';
import 'package:search_app/country.dart';
import 'CountryCard.dart';
import 'country.dart';
// import 'dart:async';

// import 'dart:io';
// import 'package:flutter/services.dart' show rootBundle;

// class MainScreen extends StatefulWidget {
//   const MainScreen({Key? key}) : super(key: key);

//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
// String country = '';
// fetchFileData() async {
//   String data;
//   data = await rootBundle.loadString('assets/resources/countries.txt');
//   setState(() {
//     country = data;
//   });
// }

class MainScreenState extends StatelessWidget {
  var countriesData = Countries.getData;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Countries List"),
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text("Countries",
                      style: TextStyle(fontFamily: 'Avenir', fontSize: 20)),
                ),
                Tab(
                  child: Text("Visted"),
                )
              ],
            ),
          ),
          body:
              // Column(
              //   children: <Widget>[
              TabBarView(
            children: <Widget>[
              Tab(
                child: CountryCard(countriesData![index]),
              ),
              Tab(
                child: Text("Visted"),
              )
            ],
          ),
          // CountriesList(),
          // ],
        )
        // )
        );
  }
}
