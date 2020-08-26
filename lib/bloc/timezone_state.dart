class TimezoneState {
  List<dynamic> timezones;
  
  TimezoneState({this.timezones});

  TimezoneState copyWith({List<dynamic> timezones}) {
    return TimezoneState(timezones: timezones ?? this.timezones);
  }
}
