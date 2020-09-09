import 'package:flutter/material.dart';

class AppState {
  final bool isTwentyFourHour;
  final DateTime startOfDay;
  final DateTime endOfDay;
  final ThemeData appTheme;

  AppState(
      {this.isTwentyFourHour, this.startOfDay, this.endOfDay, this.appTheme});

  AppState copy(
      {bool isTwentyFourHour,
      DateTime startOfDay,
      DateTime endOfDay,
      ThemeData appTheme}) {
    return AppState(
        isTwentyFourHour: isTwentyFourHour ?? this.isTwentyFourHour,
        startOfDay: startOfDay ?? this.startOfDay,
        endOfDay: endOfDay ?? this.endOfDay,
        appTheme: appTheme ?? this.appTheme);
  }

  static AppState initialState() {
    return AppState(
        isTwentyFourHour: false,
        startOfDay: DateTime.now(),
        endOfDay: DateTime.now(),
        appTheme: ThemeData(primaryColor: Colors.purpleAccent));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          isTwentyFourHour == other.isTwentyFourHour &&
          startOfDay == other.startOfDay &&
          endOfDay == other.endOfDay &&
          appTheme == other.appTheme;

  @override
  int get hashCode =>
      isTwentyFourHour.hashCode ^
      startOfDay.hashCode ^
      endOfDay.hashCode ^
      appTheme.hashCode;
}
