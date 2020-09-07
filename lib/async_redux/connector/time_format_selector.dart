import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';
import 'package:world_clock_app/async_redux/view%20model/time_model.dart';

class TimeFormatSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TimeModel>(
        model: TimeModel(),
        builder: (BuildContext context, TimeModel vm) {
          return FloatingActionButton(
            onPressed: vm.toggleTimeFormat,
            child: _twentyFourHourOrTwelveHourFormat(vm.isTwentyFourHour),
          );
        });
  }

  Widget _twentyFourHourOrTwelveHourFormat(bool isTwentyFourHour) {
    if (isTwentyFourHour) {
      return Text(
        '12H',
        style: TextStyle(fontSize: 20.0),
      );
    } else {
      return Text(
        '24H',
        style: TextStyle(fontSize: 20.0),
      );
    }
  }
}
