import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';
import 'package:world_clock_app/async_redux/view%20model/time_model.dart';

class AlarmsConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TimeModel>(
      model: TimeModel(),
      builder: (BuildContext context, TimeModel vm) {
        return _alarmCard(context, vm);
      },
    );
  }

  Widget _alarmCard(BuildContext context, TimeModel timeModel) {
    if (timeModel.alarm == null)
    {
      return Center(child: Text("No alarms"));
    }

    return Container(
      padding: EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        child: Container(
          height: 100.0,
          color: Colors.blue.withOpacity(0.60),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('${timeModel.alarm.format(context)}'),
                      Text('${timeModel.url}')
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
