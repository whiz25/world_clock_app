import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:world_clock_app/async_redux/action/change_format_action.dart';
import 'package:world_clock_app/async_redux/action/end_of_day_actions.dart';
import 'package:world_clock_app/async_redux/action/start_of_day_action.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';
import 'package:intl/intl.dart';
import 'package:world_clock_app/main.dart';

class TimeModel extends BaseModel<AppState> {
  final bool isTwentyFourHour;
  final TimeOfDay startOfDay;
  final TimeOfDay endOfDay;

  TimeModel({this.isTwentyFourHour, this.startOfDay, this.endOfDay})
      : super(equals: [isTwentyFourHour, startOfDay, endOfDay]);

  @override
  TimeModel fromStore() {
    return TimeModel(
        isTwentyFourHour: state.isTwentyFourHour,
        startOfDay: state.startOfDay,
        endOfDay: state.endOfDay);
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

  void startOfDayPicker() {
    store.dispatch(StartOfDayAction());
  }

  void endOfDayPicker() {
    store.dispatch(EndOfDayAction());
  }
}
