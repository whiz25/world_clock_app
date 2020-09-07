import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';
import 'package:world_clock_app/async_redux/view%20model/time_model.dart';

class TimeConnector extends StatelessWidget {
  final DateTime localTime;
  final TextStyle textStyle;

  const TimeConnector(this.localTime, {this.textStyle});
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TimeModel>(
        model: TimeModel(),
        builder: (BuildContext context, TimeModel vm) {
          return Text(
            vm.formatTime(localTime),
            style: textStyle,
          );
        });
  }
}
