import 'package:flutter/material.dart';

class TimezoneState {
  List<dynamic> timezones;

  TimezoneState({@required this.timezones});

  TimezoneState copyWith({List<dynamic> timezones}) {
    return TimezoneState(timezones: timezones ?? this.timezones);
  }
}
