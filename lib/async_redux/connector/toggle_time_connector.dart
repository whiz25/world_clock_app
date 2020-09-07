import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';
import 'package:world_clock_app/async_redux/view%20model/time_model.dart';

class ToggleTimeConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TimeModel>(
        model: TimeModel(),
        builder: (BuildContext context, TimeModel vm) =>
            _toggleTimeFormat(vm.isTwentyFourHour, vm));
  }

  Widget _toggleTimeFormat(bool isTwentyFourHour, model) {
    return Switch(
        value: isTwentyFourHour,
        onChanged: (isTwentyFourHour) => model.toggleTimeFormat());
  }
}
