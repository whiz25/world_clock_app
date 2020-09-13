import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';

class SetAlarmAction extends ReduxAction<AppState> {
  final String url;
  final TimeOfDay alarm;

  SetAlarmAction({this.url, this.alarm});

  @override
  Future<AppState> reduce() async {
    return state.copy(url: this.url, alarm: this.alarm);
  }
}
