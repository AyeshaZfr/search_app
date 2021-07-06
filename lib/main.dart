import 'package:flutter/material.dart';
import 'theme.dart';
import 'mainScreen.dart';
import 'dart:async';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
      theme: theme,
    );
  }
}
