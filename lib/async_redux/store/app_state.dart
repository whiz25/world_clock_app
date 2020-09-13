import 'package:flutter/material.dart';

class AppState {
  final bool isTwentyFourHour;
  final DateTime startOfDay;
  final DateTime endOfDay;
  final bool lightOrDarkTheme;
  final TimeOfDay alarm;
  final String url;

  AppState(
      {this.isTwentyFourHour,
      this.startOfDay,
      this.endOfDay,
      this.lightOrDarkTheme,
      this.alarm,
      this.url});

  AppState copy(
      {bool isTwentyFourHour,
      DateTime startOfDay,
      DateTime endOfDay,
      bool lightOrDarkTheme,
      TimeOfDay alarm,
      String url}) {
    return AppState(
        isTwentyFourHour: isTwentyFourHour ?? this.isTwentyFourHour,
        startOfDay: startOfDay ?? this.startOfDay,
        endOfDay: endOfDay ?? this.endOfDay,
        lightOrDarkTheme: lightOrDarkTheme ?? this.lightOrDarkTheme,
        alarm: alarm ?? this.alarm,
        url: url ?? this.url);
  }

  static AppState initialState() {
    return AppState(
        isTwentyFourHour: false,
        startOfDay: DateTime.now(),
        endOfDay: DateTime.now(),
        lightOrDarkTheme: false,
        url: 'Africa/Kampala',
        alarm: TimeOfDay.now());
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          isTwentyFourHour == other.isTwentyFourHour &&
          startOfDay == other.startOfDay &&
          endOfDay == other.endOfDay &&
          lightOrDarkTheme == other.lightOrDarkTheme &&
          alarm == other.alarm && url == other.url;

  @override
  int get hashCode =>
      isTwentyFourHour.hashCode ^
      startOfDay.hashCode ^
      endOfDay.hashCode ^
      lightOrDarkTheme.hashCode ^
      alarm.hashCode ^ url.hashCode;
}
