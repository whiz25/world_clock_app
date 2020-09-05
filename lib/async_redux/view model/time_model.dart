import 'package:flutter/foundation.dart';
import 'package:async_redux/async_redux.dart';
import 'package:world_clock_app/async_redux/action/change_format_action.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';

class TimeModel extends BaseModel<AppState> {
  Map<String, dynamic> time;
  VoidCallback onChangeTimeFormat;

  TimeModel({this.time, this.onChangeTimeFormat}) : super(equals: [time]);

  @override
  TimeModel fromStore() => TimeModel(
      time: state.cityTime,
      onChangeTimeFormat: () => dispatch(ChangeTimeFormatAction()));
}
