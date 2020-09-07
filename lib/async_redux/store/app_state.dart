import 'package:flutter/material.dart';

class AppState {
  final bool isTwentyFourHour;
  final TimeOfDay startOfDay;
  final TimeOfDay endOfDay;

  AppState({this.isTwentyFourHour, this.startOfDay, this.endOfDay});

  AppState copy(
      {bool isTwentyFourHour, TimeOfDay startOfDay, TimeOfDay endOfDay}) {
    return AppState(
        isTwentyFourHour: isTwentyFourHour ?? this.isTwentyFourHour,
        startOfDay: startOfDay ?? this.startOfDay,
        endOfDay: endOfDay ?? this.endOfDay);
  }

  static AppState initialState() {
    return AppState(
        isTwentyFourHour: false,
        startOfDay: TimeOfDay.now(),
        endOfDay: TimeOfDay.now());
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
