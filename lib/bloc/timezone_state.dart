import 'package:flutter/material.dart';

class TimezoneState {
  List<dynamic> timezones;
  bool hasReachedEndOfResult = false;
  int pageNumber = 0;
  int pageSize = 10;

  TimezoneState(
      {@required this.timezones,
      @required this.hasReachedEndOfResult,
      @required this.pageNumber,
      @required this.pageSize});

  TimezoneState copyWith(
      {List<dynamic> timezones,
      bool hasReachedEndOfResult,
      int pageNumber,
      int pageSize}) {
    return TimezoneState(
        timezones: timezones ?? this.timezones,
        hasReachedEndOfResult:
            hasReachedEndOfResult ?? this.hasReachedEndOfResult,
        pageNumber: pageNumber ?? this.pageNumber,
        pageSize: pageSize ?? this.pageSize);
  }
}
