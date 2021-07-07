import 'package:flutter/material.dart';
import 'countriesListData/CountryListView.dart';

class MainScreenState extends StatelessWidget {
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
                  child: Text("Visted",
                      style: TextStyle(fontFamily: 'Avenir', fontSize: 20)),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Tab(
                child: CountryListView(),
              ),
              Tab(
                child: Text("Visted"),
              )
            ],
          ),
        ));
  }
}
