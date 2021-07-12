import 'package:flutter/material.dart';
import 'model/VisitedList.dart';
import 'theme/theme.dart';
import 'view/MainScreen.dart';
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
          home: MainScreen(),
          theme: theme,
        ));
  }
}
