import 'package:flutter/material.dart';

class AppState {
  final bool isTwentyFourHour;
  final DateTime sunrise;
  final DateTime sunset;
  final bool lightOrDarkTheme;
  final TimeOfDay alarm;
  final String url;

  AppState(
      {this.isTwentyFourHour,
      this.sunrise,
      this.sunset,
      this.lightOrDarkTheme,
      this.alarm,
      this.url});

  AppState copy(
      {bool isTwentyFourHour,
      DateTime sunrise,
      DateTime sunset,
      bool lightOrDarkTheme,
      TimeOfDay alarm,
      String url}) {
    return AppState(
        isTwentyFourHour: isTwentyFourHour ?? this.isTwentyFourHour,
        sunrise: sunrise ?? this.sunrise,
        sunset: sunset ?? this.sunset,
        lightOrDarkTheme: lightOrDarkTheme ?? this.lightOrDarkTheme,
        alarm: alarm ?? this.alarm,
        url: url ?? this.url);
  }

  static AppState initialState() {
    return AppState(
        isTwentyFourHour: false,
        sunrise: DateTime.now(),
        sunset: DateTime.now(),
        lightOrDarkTheme: false);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          isTwentyFourHour == other.isTwentyFourHour &&
          sunrise == other.sunrise &&
          sunset == other.sunset &&
          lightOrDarkTheme == other.lightOrDarkTheme &&
          alarm == other.alarm &&
          url == other.url;

  @override
  int get hashCode =>
      isTwentyFourHour.hashCode ^
      sunrise.hashCode ^
      sunset.hashCode ^
      lightOrDarkTheme.hashCode ^
      alarm.hashCode ^
      url.hashCode;
}
