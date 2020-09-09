import 'package:flutter/material.dart';

ThemeData appThemeData() {
  return ThemeData(
    primaryColor: Colors.blue,
    textTheme: _appTextTheme(),
  );
}

TextTheme _appTextTheme() {
  return TextTheme(
    bodyText2: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
  );
}
