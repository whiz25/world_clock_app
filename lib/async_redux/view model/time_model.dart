import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:world_clock_app/async_redux/action/auto_fetch_action.dart';
import 'package:world_clock_app/async_redux/action/change_format_action.dart';
import 'package:world_clock_app/async_redux/action/choose_theme_action.dart';
import 'package:world_clock_app/async_redux/action/sunset_action.dart';
import 'package:world_clock_app/async_redux/action/set_alarm_action.dart';
import 'package:world_clock_app/async_redux/action/sunrise_action.dart';
import 'package:world_clock_app/async_redux/action/theme_toggle_action.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';
import 'package:intl/intl.dart';
import 'package:world_clock_app/async_redux/store/redux_store.dart';

class TimeModel extends BaseModel<AppState> {
  final bool isTwentyFourHour;
  final DateTime sunrise;
  final DateTime sunset;
  final bool lightOrDarkTheme;
  final TimeOfDay alarm;
  final String url;

  TimeModel(
      {this.isTwentyFourHour,
      this.sunrise,
      this.sunset,
      this.lightOrDarkTheme,
      this.alarm,
      this.url})
      : super(equals: [
          isTwentyFourHour,
          sunrise,
          sunset,
          lightOrDarkTheme,
          alarm,
          url
        ]);

  @override
  TimeModel fromStore() {
    return TimeModel(
        isTwentyFourHour: state.isTwentyFourHour,
        sunrise: state.sunrise,
        sunset: state.sunset,
        lightOrDarkTheme: state.lightOrDarkTheme,
        alarm: state.alarm,
        url: state.url);
  }

  String formatTime(DateTime time) {
    if (isTwentyFourHour) {
      return DateFormat.Hm().format(time);
    } else {
      return DateFormat.jm().format(time);
    }
  }

  void toggleTimeFormat() {
    store.dispatch(ChangeTimeFormatAction());
  }

  void setsunrise(DateTime newTime) {
    store.dispatch(SunriseAction(newTime));
  }

  void setsunset(DateTime newTime) {
    store.dispatch(SunsetAction(newTime));
  }

  void autoSetStartAndEnd() {
    store.dispatch(AutoFetchStartAndEndAction());
  }

  void changeThemeColor(Color newPrimaryColor) {
    store.dispatch(ColorThemeAction(newPrimaryColor));
  }

  void toggleThemeMode() {
    store.dispatch(ThemeToggleAction());
  }

  ThemeData checkThemeMode() {
    if (lightOrDarkTheme) {
      return ThemeData.dark();
    } else {
      return ThemeData.light();
    }
  }

  void setAlarm(String url, TimeOfDay alarm) {
    store.dispatch(SetAlarmAction(url: url, alarm: alarm));
  }
}
