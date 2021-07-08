import 'package:flutter/material.dart';
import 'package:search_app/CountriesListData/CountriesTab.dart';
import 'theme.dart';
import 'mainScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => VisitedList(),
          ),
        ],
        child: MaterialApp(
          home: MainScreenState(),
          theme: theme,
        ));
  }
}
