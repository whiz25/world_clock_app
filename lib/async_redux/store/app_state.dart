import 'package:flutter/material.dart';

class AppState {
  final bool isTwentyFourHour;
  final DateTime startOfDay;
  final DateTime endOfDay;
  final Color primaryColor;

  AppState({
    this.isTwentyFourHour,
    this.startOfDay,
    this.endOfDay,
    this.primaryColor,
  });

  AppState copy({
    bool isTwentyFourHour,
    DateTime startOfDay,
    DateTime endOfDay,
    Color primaryColor,
  }) {
    return AppState(
      isTwentyFourHour: isTwentyFourHour ?? this.isTwentyFourHour,
      startOfDay: startOfDay ?? this.startOfDay,
      endOfDay: endOfDay ?? this.endOfDay,
      primaryColor: primaryColor ?? this.primaryColor,
    );
  }

  static AppState initialState() {
    return AppState(
      isTwentyFourHour: false,
      startOfDay: DateTime.now(),
      endOfDay: DateTime.now(),
      primaryColor: Colors.redAccent,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          isTwentyFourHour == other.isTwentyFourHour &&
          startOfDay == other.startOfDay &&
          endOfDay == other.endOfDay &&
          primaryColor == other.primaryColor;

  @override
  int get hashCode =>
      isTwentyFourHour.hashCode ^
      startOfDay.hashCode ^
      endOfDay.hashCode ^
      primaryColor.hashCode;
}
