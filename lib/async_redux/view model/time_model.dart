import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:world_clock_app/async_redux/action/auto_fetch_action.dart';
import 'package:world_clock_app/async_redux/action/change_format_action.dart';
import 'package:world_clock_app/async_redux/action/choose_theme_action.dart';
import 'package:world_clock_app/async_redux/action/end_of_day_actions.dart';
import 'package:world_clock_app/async_redux/action/start_of_day_action.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';
import 'package:intl/intl.dart';
import 'package:world_clock_app/main.dart';

class TimeModel extends BaseModel<AppState> {
  final bool isTwentyFourHour;
  final DateTime startOfDay;
  final DateTime endOfDay;
  final Color primaryColor;

  TimeModel(
      {this.isTwentyFourHour,
      this.startOfDay,
      this.endOfDay,
      this.primaryColor})
      : super(equals: [isTwentyFourHour, startOfDay, endOfDay, primaryColor]);

  @override
  TimeModel fromStore() {
    return TimeModel(
        isTwentyFourHour: state.isTwentyFourHour,
        startOfDay: state.startOfDay,
        endOfDay: state.endOfDay,
        primaryColor: state.primaryColor);
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

  void setStartOfDay(DateTime newTime) {
    store.dispatch(StartOfDayAction(newTime));
  }

  void setEndOfDay(DateTime newTime) {
    store.dispatch(EndOfDayAction(newTime));
  }

  void autoSetStartAndEnd() {
    store.dispatch(AutoFetchStartAndEndAction());
  }

  void changeThemeColor(Color newPrimaryColor) {
    store.dispatch(ColorThemeAction(newPrimaryColor));
  }
}
