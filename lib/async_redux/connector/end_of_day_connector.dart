import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';
import 'package:world_clock_app/async_redux/view%20model/time_model.dart';

class EndDayConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TimeModel>(
        model: TimeModel(),
        builder: (BuildContext context, TimeModel vm) =>
            _row(context, vm.endOfDay.format(context)));
  }

  Row _row(BuildContext context, model) {
    return Row(
      children: [_endOfDay(model), _selectEndOfDayTime(context)],
    );
  }

  Text _endOfDay(String value) {
    return Text('Start of day: $value');
  }

  IconButton _selectEndOfDayTime(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.edit), onPressed: () => _showTimePicker(context));
  }

  Future<TimeOfDay> _showTimePicker(BuildContext context) async {
    return await showTimePicker(context: context, initialTime: TimeOfDay.now());
  }
}
