import 'package:flutter/foundation.dart';
import 'package:async_redux/async_redux.dart';
import 'package:world_clock_app/async_redux/action/change_format_action.dart';
import 'package:world_clock_app/async_redux/action/regions_action.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';

class TimeModel extends BaseModel<AppState> {
  String cityTime;
  String localTime;
  int twelveHour;
  bool isTwentyFourHour;
  List<String> regions;
  VoidCallback onChangeTimeFormat;

  TimeModel(
      {this.cityTime,
      this.onChangeTimeFormat,
      this.localTime,
      this.twelveHour,
      this.regions,
      this.isTwentyFourHour})
      : super(equals: [
          cityTime,
          localTime,
          twelveHour,
          regions,
          isTwentyFourHour
        ]);

  @override
  TimeModel fromStore() => TimeModel(
      cityTime: state.cityTime,
      localTime: state.localTime,
      twelveHour: state.twelveHour,
      regions: state.regions,
      isTwentyFourHour: state.isTwentyFourHour,
      onChangeTimeFormat: () => dispatch(ChangeTimeFormatAction()));
}
