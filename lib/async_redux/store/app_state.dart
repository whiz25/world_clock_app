import 'package:flutter/material.dart';

class AppState {
  final bool isTwentyFourHour;
  final DateTime startOfDay;
  final DateTime endOfDay;

  AppState({this.isTwentyFourHour, this.startOfDay, this.endOfDay});

  AppState copy(
      {bool isTwentyFourHour, DateTime startOfDay, DateTime endOfDay}) {
    return AppState(
        isTwentyFourHour: isTwentyFourHour ?? this.isTwentyFourHour,
        startOfDay: startOfDay ?? this.startOfDay,
        endOfDay: endOfDay ?? this.endOfDay);
  }

  static AppState initialState() {
    return AppState(
        isTwentyFourHour: false,
        startOfDay: DateTime.now(),
        endOfDay: DateTime.now());
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          isTwentyFourHour == other.isTwentyFourHour &&
          startOfDay == other.startOfDay &&
          endOfDay == other.endOfDay;

  @override
  int get hashCode =>
      isTwentyFourHour.hashCode ^ startOfDay.hashCode ^ endOfDay.hashCode;
}
