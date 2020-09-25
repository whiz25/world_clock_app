import 'package:world_clock_app/model/timezone.dart';

class TimezoneState {
  TimezoneList timezones;

  TimezoneState({this.timezones});

  TimezoneState copyWith({TimezoneList timezones}) {
    return TimezoneState(timezones: timezones ?? this.timezones);
  }
}
