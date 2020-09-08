import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';
import 'package:world_clock_app/async_redux/view%20model/time_model.dart';

class StartDayConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TimeModel>(
        model: TimeModel(),
        builder: (BuildContext context, TimeModel vm) =>
            _row(context, vm.startOfDay.format(context)));
  }

  Row _row(BuildContext context, model) {
    return Row(
      children: [_startOfDay(model), _selectStartOfDayTime(context)],
    );
  }

  Text _startOfDay(String value) {
    return Text('Start of day: $value');
  }

  IconButton _selectStartOfDayTime(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.edit), onPressed: () => _showTimePicker(context));
  }

  Future<TimeOfDay> _showTimePicker(BuildContext context) async {
    return await showTimePicker(context: context, initialTime: TimeOfDay.now());
  }
}
