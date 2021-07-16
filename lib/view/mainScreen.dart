import 'package:flutter/material.dart';
import 'CountriesTab.dart';
import 'VisitedTab.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
            title: Column(children: [
              Text("Countries List", style: TextStyle(fontSize: 24)),
            ]),
            bottom: TabBar(
              labelColor: Colors.black,
              tabs: [
                Tab(
                  child: Text("Countries",
                      style: Theme.of(context).textTheme.headline1),
                ),
                Tab(
                  child: Text("Visted",
                      style: Theme.of(context).textTheme.headline1),
                )
              ],
            ),
          ),
          body: Container(
            color: Colors.white,
            child: TabBarView(
              children: <Widget>[
                Tab(
                  child: CountriesTab(),
                ),
                Tab(
                  child: VisitedCountries(),
                )
              ],
            ),
          ),
        ));
  }
}
