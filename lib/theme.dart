import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  fontFamily: "Avenir",
  primarySwatch: Colors.grey,
  backgroundColor: Colors.white,
  hintColor: Colors.grey.withOpacity(0.8),
  errorColor: Colors.red,
  focusColor: Colors.green,
  primaryColorDark: Colors.black,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.white, foregroundColor: Colors.grey),
  buttonColor: Colors.grey,
  accentColor: Colors.grey,
  disabledColor: Colors.black26,
  dividerColor: Colors.grey,
  buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(20.0))),
);
