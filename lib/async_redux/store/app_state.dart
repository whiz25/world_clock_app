import 'package:flutter/material.dart';

class AppState {
  final bool isTwentyFourHour;
  final DateTime startOfDay;
  final DateTime endOfDay;
  final bool lightOrDarkTheme;

  AppState(
      {this.isTwentyFourHour,
      this.startOfDay,
      this.endOfDay,
      this.lightOrDarkTheme,
      });

  AppState copy(
      {bool isTwentyFourHour,
      DateTime startOfDay,
      DateTime endOfDay,
      bool lightOrDarkTheme,
      }) {
    return AppState(
        isTwentyFourHour: isTwentyFourHour ?? this.isTwentyFourHour,
        startOfDay: startOfDay ?? this.startOfDay,
        endOfDay: endOfDay ?? this.endOfDay,
        lightOrDarkTheme: lightOrDarkTheme ?? this.lightOrDarkTheme,
       );
  }

  static AppState initialState() {
    return AppState(
        isTwentyFourHour: false,
        startOfDay: DateTime.now(),
        endOfDay: DateTime.now(),
        lightOrDarkTheme: true,
        );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          isTwentyFourHour == other.isTwentyFourHour &&
          startOfDay == other.startOfDay &&
          endOfDay == other.endOfDay &&
          lightOrDarkTheme == other.lightOrDarkTheme;

  @override
  int get hashCode =>
      isTwentyFourHour.hashCode ^
      startOfDay.hashCode ^
      endOfDay.hashCode ^
      lightOrDarkTheme.hashCode;
}
