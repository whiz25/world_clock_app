import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';
import 'package:world_clock_app/async_redux/view%20model/time_model.dart';
import 'package:world_clock_app/ui/raised_button.dart';

class EndDayConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TimeModel>(
        model: TimeModel(),
        builder: (BuildContext context, TimeModel vm) => RaisedButtonPage(
              pickedTime: vm.endOfDay,
              onTimePicked: vm.setEndOfDay,
              text: ' End: ${vm.endOfDay.toString().substring(11, 16)}',
            ));
  }
}
