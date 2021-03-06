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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        key: Key('toggle_time_format'),
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        elevation: 4.0,
        child: Container(
          alignment: Alignment.center,
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '12Hr',
              ),
              Switch(
                  value: isTwentyFourHour,
                  onChanged: (isTwentyFourHour) => model.toggleTimeFormat()),
              Text(
                '24Hr',
              )
            ],
          ),
        ),
      ),
    );
  }
}
