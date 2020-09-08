import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';
import 'package:world_clock_app/async_redux/view%20model/time_model.dart';
import 'package:world_clock_app/ui/raised_button.dart';

class StartDayConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TimeModel>(
        model: TimeModel(),
        builder: (BuildContext context, TimeModel vm) => RaisedButtonPage(
              pickedTime: vm.startOfDay,
              onTimePicked: vm.setStartOfDay,
              text: ' Start: ${DateFormat.jm().format(vm.startOfDay)}',
            ));
  }
}
